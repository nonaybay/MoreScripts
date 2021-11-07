#!/usr/bin/python3

from genericpath import isfile
from os import getenv, makedirs
from posix import listdir
from shutil import move


current_user = getenv('USER')
current_path = getenv('PWD')
user_home = getenv('HOME')
user_home = '/home/{}'.format(current_user)
path_textfiles = '{}/Documents/Text'.format(user_home)
path_datafiles = '{}/Documents/Data'.format(user_home)
path_pagelayoutfiles = '{}/Documents/PageLayout'.format(user_home)
path_spreadsheetfiles = '{}/Documents/Spreadsheet'.format(user_home)
path_databasefiles = '{}/Documents/Database'.format(user_home)
path_executablefiles = '{}/Documents/Executable'.format(user_home)
path_fontfiles = '{}/Documents/Fonts'.format(user_home)
path_systemfiles = '{}/Documents/System'.format(user_home)
path_settingsfiles = '{}/Documents/Settings'.format(user_home)
path_compressedfiles = '{}/Documents/Compressed'.format(user_home)
path_rasterimagefiles = '{}/Pictures/Raster'.format(user_home)

paths = [
    path_textfiles,
    path_datafiles,
    path_pagelayoutfiles,
    path_spreadsheetfiles,
    path_databasefiles,
    path_executablefiles,
    path_fontfiles,
    path_systemfiles,
    path_settingsfiles,
    path_compressedfiles,
    path_rasterimagefiles,
]

file_extensions_textfiles = ('.doc', '.docx', '.log', '.msg', '.odt', '.pages', '.rtf', '.text', '.txt', '.wpd', '.wps')
file_extensions_datafiles = ('.csv', '.dat', '.ged', '.key', '.keychain', '.ppt', '.pptx', '.sdf', '.tar', '.tax2016', '.tax2020', '.vcf', '.xml')
file_extensions_pagelayoutfiles = ('.indd', '.pct', '.pdf')


def gnhfecf(directory):
    return [file for file in listdir(directory) if isfile(file) and not file.startswith('.') and not file.__eq__(__file__)]

def create_path(pathlist):
    for path in pathlist:
        makedirs(path, exist_ok=True)

def move_files(files):
    for file in files:
        if file.endswith(file_extensions_textfiles):
            move(file, '{}/{}'.format(path_textfiles, file))
        elif file.endswith(file_extensions_datafiles):
            move(file, '{}/{}'.format(path_datafiles, file))
        elif file.endswith(file_extensions_pagelayoutfiles):
            move(file, '{}/{}'.format(path_pagelayoutfiles, file))


create_path(paths)
files = gnhfecf(current_path)
move_files(files)