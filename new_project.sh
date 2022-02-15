#!/bin/bash

# Requires GitHubCLI to be installed before running see website



# Ask user for project name
echo Enter project name:

# user input project name
read project_name

# Create file system using cookiecutter
python3 -m pip install cookiecutter
cookiecutter https://github.com/drivendata/cookiecutter-data-science


# # Create project folder - not required cookitecutter does this
# echo "New project folder name: $project_name"
# mkdir $project_name

# Move to project folder
echo "New project folder location: $project_name"
cd $project_name

# create virtual environment and activate
virtual_env_name="env_$project_name"
python3 -m venv $virtual_env_name
python3 -m ipykernel install --user --name=$virtual_env_name
python3 -m pip install -U scikit-learn
python3 -m pip install scikit-plot
source $virtual_env_name/bin/activate


# add standard libraries to install here

# update requirements text file
pip freeze > requirements.txt


# Initialize the local directory as a Git repository.
git init -b main

# Stage and commit all the files in your project
git add . && git commit -m "initial commit"

# login to github account
sudo gh auth login

# create repo on github
sudo gh repo create

# user will need to reactivate it after script has run
echo "Project $project_name has been created locally and on GitHub"
echo "To activate virtual environment locally go to file and type: source $virtual_env_name/bin/activate"
