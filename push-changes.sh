#!/bin/bash
# A script for automatically updating my portfolio site's resume asset and pushing the changes to GitHub
YELLOW='\033[1;33]'
GREEN='\033[0;32]'
NC='\033[0m' # No Color

printf "${YELLOW}Enter a commit message:${NC}"
read COMMIT_MESSAGE
if [ "$COMMIT_MESSAGE" = "" ] ; then
  COMMIT_MESSAGE="Update resume"
fi

echo -e "${GREEN}About to push changes to resume github repo${NC}" # -e to allow backslash escapes when using echo
git add *-resume.pdf *-resume.log *-resume.xtx
git commit -m "$COMMIT_MESSAGE"
git push origin master

cp *-resume.pdf ~/workspace/markcuipan-dot-com/resume/

echo -e "${GREEN}Switching to portfolio site local repo${NC}"
cd ~/workspace/markcuipan-dot-com/

echo "${GREEN}About to push changes to portfolio site github repo${NC}"
git add *markcuipan-resume.pdf
git commit -m "$COMMIT_MESSAGE"
git push origin master
