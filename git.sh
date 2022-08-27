cd /usr/bin/Jmeter/leapx-backstage-docs
git pull
echo "Enter your message"
read message
git add .
git commit -m "${message}"
git push
