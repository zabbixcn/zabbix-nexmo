# Zabbix Nexmo Alerts

Simple bash scripts for sending [Zabbix](http://www.zabbix.com) alerts to SMS and telephone via [Nexmo](https://www.nexmo.com/).

## Installation

#### 1) Place sms.sh and telephone.sh in AlertScriptsPath

The `AlertScriptsPath` is defined in zabbix_server.conf (`grep AlertScriptsPath /etc/zabbix/zabbix_server.conf`). Don't forget to apply the correct permissions (e.g. `chown root:zabbix sms.sh`, `chmod 750 sms.sh`).

#### 2) Create new Media Type(s) in Zabbix

You will need to create separate Media Types for SMS and Telephone alerts. Media types can be found within the Zabbix interface via "Administration" -> "Media Types". The Media Type(s) should be configured as so:

* Name: SMS, Telephone or anything you prefer
* Type: Script
* Script name: sms.sh or telephone.sh
* Script parameters for sms.sh:
    1. Your Nexmo API key.
    2. Your Nexmo API secret.
    3. `{ALERT.SENDTO}`
    4. The "From" string (e.g. "Zabbix").
    5. The message (e.g. `{ALERT.MESSAGE}` or `{ALERT.SUBJECT}`).
* Script parameters for telephone.sh:
    1. Your Nexmo API key.
    2. Your Nexmo API secret.
    3. `{ALERT.SENDTO}`
    4. The message (e.g. `{ALERT.MESSAGE}` or `{ALERT.SUBJECT}`).
    5. (Optional) How many times to repeat the message. Defaults to 1.
    6. (Optional) The number to call from, if you have purchased one with Nexmo.

#### 3) Add the Media Type to a Zabbix user

Add the new Media Type(s) to one or more of your Zabbix users. The "Send to" field should be a phone number in international format e.g. "+4412345678910".

#### 4) Create an Action or update an existing one

You'll need an action configured to send alerts via your newly defined Media Type(s).

## Testing

Once configured you should trigger an alert to test the implementation.

To confirm the scripts themselves are functioning properly, try running them from the command line:

```
./sms.sh 'API Key' 'API Secret' 'Your Number' 'Zabbix' 'Your message'
./telephone.sh 'API Key' 'API Secret' 'Your Number' 'Your message'
```

## Changelog

##### 2016-06-17 1.0.0

First version, Hello World!
