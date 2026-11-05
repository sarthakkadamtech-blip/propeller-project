
#!/bin/bash

# REPO_URL: https://github.com/sarthakkadamtech-blip/propeller-project

# Create React application
npx create-react-app propeller-project

# Navigate into project
cd propeller-project

# Initialize Git and initial commit
git init
git add .
git commit -m "Initial React app"
git branch -M master

# Create GitHub public repository
gh auth login
gh repo create propeller-project --public --source=. --remote=origin --push

# Create update_logo branch
git switch -c update_logo

# Replace logo
curl.exe -L "https://cdn-ikponof.nitrocdn.com/vGqfYAGIOLDkYkJqZhYIYKEsibdbZnkc/assets/images/optimized/rev-f684a87/www.propelleraero.com/wp-content/uploads/2023/05/footer-logo.svg" -o src/logo.svg

# Update website link in src/App.js
# https://www.propelleraero.com/dirtmate/

# Commit and push
git add .
git commit -m "Update Propeller Aero logo and link"
git push -u origin update_logo

# Create Pull Request
gh pr create --base master --head update_logo --title "Update Propeller Aero logo" --body "Replaced the default React logo and updated the website link."

# Merge Pull Request
gh pr merge 1 --merge
