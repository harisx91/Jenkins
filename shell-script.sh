#!/bin/bash

# Fetch advice from the API
curl -s https://api.adviceslip.com/advice > advice.json

# Extract advice text
cat advice.json | jq -r .slip.advice > advice.message

# Test to make sure the advice message has more than 5 words
word_count=$(wc -w < advice.message)

if [ $word_count -gt 5 ]; then
  echo "Advice has more than 5 words"
else
  echo "Advice $(cat advice.message) has 5 words or less"
fi

# Deploy cowsay
sudo yum install cowsay -y

# Ensure path is correct
echo $PATH
export PATH="$PATH:/usr/games:/usr/local/games"

# Display advice with cowsay
cat advice.message | cowsay -f $(ls /usr/share/cowsay/cows | shuf -n 1)
