#!/bin/bash

# Organization for the course
ORGANIZATION='USP-research'

# Repository for the course notebooks
NOTEBOOKS_REPO='notebooks'

# Branch from where the notebooks are fetched from
# Typically 'master' or 'main'
# (different years/courses can also be on separate branches of the same repo)
BRANCH='digital-urban-2022'

# Folder name that will appear in the CSC instance
# This is used to avoid conflicts when cloning if a student has participated to many courses using similar CSC environment
COURSE_FOLDER='digital-urban'

cd /home/jovyan/work
# git reflog requires a name and email if user is not in passwd
# even if you're only cloning
export GIT_COMMITTER_NAME=anonymous
export GIT_COMMITTER_EMAIL=anon@localhost

# Parse the GitHub repository
SOURCE_REPO="https://github.com/$ORGANIZATION/$NOTEBOOKS_REPO.git"

# Grab notebooks repository
NB_FOLDER_NAME="$COURSE_FOLDER/notebooks"
NOTEBOOK_DIR="/home/jovyan/work/$NB_FOLDER_NAME"

if [ -d "$NOTEBOOK_DIR" ]; then
    # Change directories and pull
    cd "$NOTEBOOK_DIR"
    git pull origin $BRANCH
else
    # Clone the notebooks directory
    git clone --single-branch --branch $BRANCH $SOURCE_REPO $NB_FOLDER_NAME
fi

# Create data directory if it doesn't exist
DATA_FOLDER_NAME="$COURSE_FOLDER/data"
DATA_DIR="/home/jovyan/work/$DATA_FOLDER_NAME"

if [ ! -d "$DATA_DIR" ]; then
    mkdir $DATA_DIR
fi

# If needed, add data download/extract commands here
# cd "$DATA_DIR"
# FILESRC="<MYLINK_TO_DATA>"
# wget $FILESRC

# Create exercises directory if it doesn't exist
EX_FOLDER_NAME="$COURSE_FOLDER/exercises"
EXERCISE_DIR="/home/jovyan/work/$EX_FOLDER_NAME"

if [ ! -d "$EXERCISE_DIR" ]; then
    mkdir $EXERCISE_DIR
fi

# Go to containing folder
cd "$NOTEBOOK_DIR"
