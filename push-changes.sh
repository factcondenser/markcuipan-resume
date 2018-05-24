#!/bin/bash
# A script for automatically updating my portfolio site's resume asset and pushing the changes to GitHub
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

RESUME_NAME='markcuipan-resume'

printf "${YELLOW}Enter a commit message:${NC} "
read COMMIT_MESSAGE
if [ "$COMMIT_MESSAGE" = "" ] ; then
  COMMIT_MESSAGE="Update resume"
fi

echo -e "${GREEN}About to push changes to resume github repo${NC}" # -e to allow backslash escapes when using echo
git add $RESUME_NAME.pdf $RESUME_NAME.log $RESUME_NAME.xtx
git commit -m "$COMMIT_MESSAGE"
git push origin master

cp $RESUME_NAME.pdf pdf_backups/$RESUME_NAME-$(date "+%Y-%m-%d-%H:%M:%S").pdf
cp $RESUME_NAME.pdf ~/workspace/markcuipan-dot-com/resume/

echo -e "${GREEN}Switching to portfolio site local repo${NC}"
cd ~/workspace/markcuipan-dot-com/

echo -e "${GREEN}About to push changes to portfolio site github repo${NC}"
git add $RESUME_NAME.pdf
git commit -m "$COMMIT_MESSAGE"
git push origin master
