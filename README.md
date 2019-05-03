# WebsocketTest - NTOU 2019 Spring Network Homework

## Usage
This application implements basic gift/vouche code validation, using GDrive as Cloud Database.
Run the server (host at 0.0.0.0):
```
ruby main.rb
```
...or run locally
```
ruby main.rb -l
```
After the server is up, you can test with client/socket.rb
Internet host/Localhost server:
```
ruby clirent/socket.rb
ruby clirent/socket.rb -l
```
If successed, server will return 200; return 404 otherwise.

## Installation
Clone this project and run `bundle install` (if you don't have corrsponding dependency), then set the enviroment variable correctly(or replace the ENV directly in the code):
```
GCP_RubyHost=127.0.0.7:8080 // ip:port
GCP_SAK=<your google drive service account key>
```
GDrive Folder structre:
```
                             <Data Parent Folder>
                                       │
       ┌───────────────────────────────┼───────────────────────────────┐
<Voucher1 Prefix>              <Voucher2 Prefix>               <Voucher3 Prefix> ...
         │                             │                               │
    ┌────┴─────┐                  ┌────┴─────┐                    ┌────┴─────┐
codes.txt  usage.txt           codes.txt  usage.txt            codes.txt  usage.txt
```
Edit the `GDriveParentID` in websocket_test.rb to the id of your data parent folder<br><br>
<b>Voucher Prfix:</b> Folder title, a length=5 string which equals first 5 characters of the voucher code<br>
<b>codes.txt:</b> Valid code string(length<20) next to the voucher prefix(for the bulk distribution)<br>
<b>usage.txt:</b> Record which line of code has been used<br><br>
See the files in `data/` for example (strcture is same on google drive)<br>

## Copyright info
OK for commercial use as long as you credit me([Compeador/ken1882/Jun-Kai Chao](https://github.com/ken1882))
