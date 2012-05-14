## Instructions to give second mouse its own pointer
echo "
xinput create-master Auxiliary
xinput list
# find the ID for one mouse and use in the following:
xinput reattach 8 "Auxiliary pointer"
"
