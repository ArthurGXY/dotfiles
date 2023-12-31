#!/usr/bin/env python3
from typing import List, AnyStr
from os import PathLike
import os


# 1 category maps to:
#   1 list of sources and 
#   1 list of destinations 
# in `sources` and `dests`
root = os.getcwd()
categories: List[AnyStr] = [] 
sources: List[List[AnyStr]] = [] # sources and dests are 1-to-1 mapping
dests: List[List[AnyStr]] = []

def ensure_dir(dir: PathLike):
    if os.path.isdir(dir):
        return
    else:
        os.mkdir(dir)
        

def read_list(list_path: PathLike):
    # reads the 'list' file in the folder to track which folders are managed.
    categories_count = 0
    # resets the lists in the script
    
    print("reading list.")
    
    with open(list_path, 'r') as list_file:
        for line in list_file:
            if line.strip(): 
                if line.startswith("#") or line.startswith("\n"):
                    continue
                elif line.startswith("-"):
                    categories_count += 1
                    categories.append(line.split("-")[-1].strip())
                    sources.append([])
                    dests.append([])
                else:
                    src, dest = [x.strip() for x in line.split(" ")]
                    sources[categories_count - 1].append(os.path.expanduser(src))
                    dests[categories_count - 1].append(os.path.expanduser(dest))
                    
    print(f"categories: {categories}\nsources: {sources}\ndestinations: {dests}")
                    

def backup():
    # copy files according to the 3 managed lists
    
    categories_count = categories.__len__()
    print(f"Entered backup, categories: {categories_count}")
    for i in range(categories_count):
        print(f"Backing up category {categories[i]}")
        for src, dest in zip(sources[i], dests[i]):
            
            parent_dir = os.path.dirname(dest)
            
            copy_cmd = f"cp {src} {parent_dir if parent_dir else root} -r"
            
            print(f"Copying from {src} -> {dest}")
            
            if not os.path.exists(src):
                print(f"Source {src} does not exist.")
                
            elif os.path.isfile(src):
                ensure_dir(parent_dir) if parent_dir else None 
                os.system(copy_cmd)
                
            elif os.path.isdir(src):
                ensure_dir(dest)
                if os.path.isdir(dest): 
                    # copy each file into dest instead of the directory.
                    copy_cmd = f"cp {src}/* {parent_dir if parent_dir else root} -r"
                os.system(copy_cmd)
                
            else:
                print("Unknown situation happened.")
                continue

def restore():
    # todo: restore backup files
    pass

def main():
    read_list("./list")
    backup()
    
    
if __name__ == "__main__":
    main()