import argparse
import os
import platform
import time
import requests
import zipfile
import errno
import shutil

####### Constant Functions #######

super_dir = ''

# Returns true if we are on windows
def is_windows():
	return platform.system() == "Windows"

# Returns true if we are on linux
def is_linux():
	return platform.system() == "Linux"

# Returns the system-specific seperator
def sep():
	if is_windows():
		return "\\"
	return "/"

####### Constants #######

deps = [
	"vcpkg", "cmake", "doxygen"
]

download_urls = {
	"vcpkg": "https://github.com/microsoft/vcpkg/archive/refs/tags/2022.05.10.zip",
}

extracted_dirs = {
	"vcpkg": "vcpkg-2022.05.10",
}

dep_direct = {
	"vcpkg": False,
	"cmake": False,
	"doxygen": False,
}

if is_windows():
	download_urls['cmake'] = "https://github.com/Kitware/CMake/releases/download/v3.24.1/cmake-3.24.1-windows-x86_64.zip"
	extracted_dirs['cmake'] = "cmake-3.24.1-windows-x86_64"

	download_urls['doxygen'] = "https://www.doxygen.nl/files/doxygen-1.9.5.windows.x64.bin.zip"
	extracted_dirs['doxygen'] = ""

####### GENERIC FUNCTIONS #######

# Prints a message to the commandline
def message(text=""):
	print(text + "\033[0m")

# Yellowish color
def info():
	return "\033[93m"

# Green color
def succ():
	return "\033[92m"

# Red color
def error():
	return "\033[91m"

# Cyan color
def param():
	return "\033[96m"

# Removes a directory
def rmdir(dir, in_deps=True):
	try:
		message(info() + "Removing \"" + param() + dir + info() + "\"...")
		if in_deps:
			shutil.rmtree(super_dir + sep() + dir)
		else:
			shutil.rmtree(dir)
		message(succ() + "Removed \"" + param() + dir + succ() + "\"!")
	except:
		message(error() + "Folder does not exist: \"" + param() + dir + error() + "\"!")

def rmfile(file, in_deps=True):
	try:
		message(info() + "Removing \"" + param() + file + info() + "\"...")
		if in_deps:
			os.remove(super_dir + sep() + file)
		else:
			os.remove(file)
		message(succ() + "Removed \"" + param() + file + succ() + "\"!")
	except:
		if not quiet:
			message(error() + "File does not exist: \"" + param() + file + error() + "\"!")
		else:
			message(succ() + "Removed \"" + param() + file + succ() + "\"!")

# Renames a directory
# Credits: https://github.com/conan-io/conan/issues/6560#issuecomment-661679853
def rename(src, dst):
	message(info() + "Renaming " + param() + src + info() + " to " + param() + dst + info() + "...")
	if is_windows():
		try:
			os.rename(super_dir + sep() + src, super_dir + sep() + dst)
		except OSError as e:
			if e.errno == errno.EEXIST:
				os.remove(super_dir + sep() + dst)
				os.rename(super_dir + sep() + src, super_dir + sep() + dst)
			elif e.errno == errno.EACCES:
				retry = 30
				while retry:
					time.sleep(0.5)
					try:
						os.rename(super_dir + sep() + src, super_dir + sep() + dst)
						retry = 0
					except OSError as e:
						if retry and e.errno == errno.EACCES:
							retry = retry - 1
						else:
							raise
			else:
				raise
	else:
		os.rename(super_dir + sep() + src, super_dir + sep() + dst)
	message(succ() + "Renamed " + param() + src + succ() + " to " + param() + dst + succ() + "!")

# Downloads a file from <url> and saves it as <name>
def download(name, url):
	message(info() + "Downloading from " + param() + url + info() + " and saving to " + param() + name + info() + "...")
	response = requests.get(url)
	open(super_dir + sep() + name,"wb").write(response.content)
	message(succ() + "Downloaded " + param() + name + succ() + "!")

# Extracts the zipfile named <name>
def extract(name, dir = "."):
	message(info() + "Extracting " + param() + name + info() + "...")
	with zipfile.ZipFile(super_dir + sep() + name, 'r') as zip:
		zip.extractall(super_dir + sep() + dir)
		zip.close()
	message(succ() + "Extracted " + param() + name + succ() + "!")

####### HELPER FUNCTIONS #######

def download_and_extract_if_needed(name):
	url = download_urls[name]
	extracted_dir = extracted_dirs[name]
	message(info() + "Installing " + param() + name + info() + "...")
	if dep_direct[name]:
		if not os.path.exists(super_dir + sep() + name):
			download(name, url)
			message()
		else:
			message(param() + name + info() + " already exists! If you want a clean build, run either clean + build, or simply rebuild!\n")
	else:
		if not os.path.isdir(super_dir + sep() + name):
			message(param() + name + info() + " doesn't exist yet...")
			download(name + ".zip", url)
			if extracted_dir == "" :
				extract(name + ".zip",name)
			else:
				extract(name + ".zip")
				rename(extracted_dir, name)
			os.remove(super_dir + sep() + name + ".zip")
			message(succ() + "Installed " + param() + name + succ() + "!\n")
		else:
			message(param() + name + info() + " already exists! If you want a clean build, run either clean + build, or simply rebuild!\n")

####### WORKSPACE FUNCTIONS #######

# Builds the workspace
def build_workspace():
	message(info() + "Building " + param() + "Workspace" + info() + "...\n")
	for dep in deps:
		download_and_extract_if_needed(dep)
	message(succ() + "Built " + param() + "Workspace" + succ() + "!")

# Cleans the Workspace
def clean_workspace():
	message(info() + "Cleaning " + param() + "Workspace" + info() + "...\n")
	for x in deps:
		if dep_direct[x]:
			rmfile(x)
		else:
			rmdir(x)
	message(succ() + "\nCleaned " + param() + "Workspace" + succ() + "!")

# Handles the parameters passed when the workspace is supposed to be manipulated
def workspace(args):
	if args.type == "build":
		build_workspace()
	elif args.type == "clean":
		clean_workspace()
	else:
		clean_workspace()
		build_workspace()

####### CMAKE FUNCTIONS #######

# Returns the location of the cmake.exe
def cmake_command():
	if is_windows():
		return "\"" + super_dir + sep() + "cmake" + sep() + "bin" + sep() + "cmake.exe\""
	return ""

# Cleans the cmake generated files
def clean_cmake():
	message(info() + "Cleaning " + param() + "CMake" + info() + "...\n")
	rmdir("project", False)
	rmdir("libs")
	rmdir("docs/api", False)
	rmdir("docs/build", False)
	rmdir("docs/doxygen", False)
	message(succ() + "\nCleaned " + param() + "CMake" + succ() + "!")

# Builds the cmake project
def build_cmake():
	message(info() + "Building " + param() + "CMake" + info() + "...\n")
	if os.system(cmake_command() + " -S . -B project -Wno-dev -Wdeprecated -Werror=deprecated") != 0:
		message(error() + "\nErrors occured while building " + param() + "CMake" + error() + "!")
	else:
		message(succ() + "\nBuilt " + param() + "CMake" + succ() + "!")

# Handles the parameters passed when cmake is supposed to be manipulated
def cmake(args):
	if args.type == "build":
		build_cmake()
	elif args.type == "clean":
		clean_cmake()
	else:
		clean_cmake()
		build_cmake()

####### MAIN FUNCTION #######

# Sets up the CLI

my_parser = argparse.ArgumentParser(description="Wizard for managing the workspace")

my_parser.add_argument('-d', '--directory', help='', required=True)

sub_parser = my_parser.add_subparsers(help="Choose a managing target", required=True)

# Workspace Subparser

parser_workspace = sub_parser.add_parser("workspace", help="Manage the workspace")
parser_workspace.add_argument("type", type=str, choices=["build", "clean", "rebuild"], help="Builds/Cleans/Rebuilds the workspace (e.g. downloads dependencies)")
parser_workspace.set_defaults(func=workspace)

# CMake Subparser

parser_cmake = sub_parser.add_parser("cmake", help="Manage CMake")
parser_cmake.add_argument("type", type=str, choices=["build", "clean", "rebuild"], help="Builds/Cleans/Rebuilds the project")
parser_cmake.set_defaults(func=cmake)

# Parse arguments

args = my_parser.parse_args()
super_dir = args.directory
os.system('color')
message()
args.func(args)
