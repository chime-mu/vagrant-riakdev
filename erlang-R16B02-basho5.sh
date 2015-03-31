#!/usr/bin/env bash

if [[ $(erl +V 2>&1) != Erlang*5.10.3* ]]
then
	apt-get update
	apt-get -y install build-essential libncurses5-dev openssl libssl-dev fop xsltproc unixodbc-dev libpam0g-dev
	cd /tmp
	wget -q http://s3.amazonaws.com/downloads.basho.com/erlang/otp_src_R16B02-basho5.tar.gz
	tar zxvf otp_src_R16B02-basho5.tar.gz
	cd otp_src_R16B02-basho5
	./configure && make && sudo make install
	rm -rf /tmp/otp_src_R16B02-basho5.gz otp_src_R16B02-basho5
	# Install rebar
	wget -q https://github.com/rebar/rebar/wiki/rebar
	chmod +x rebar
	mv rebar /usr/local/bin
else
	echo Seems Erlang R16B02-basho5 is already installed
fi