#!/bin/bash

discord_url=""
text1="<@userid> [Transmission] "
text2=" has finished downloading!"
text="${text1} ${TR_TORRENT_NAME} ${text2}"
generate_post_data(){
        cat <<EOF
{
"content":"${text}"
}
EOF
}

curl -H "Content-Type: application/json" -X POST -d "$(generate_post_data)" $discord_url
