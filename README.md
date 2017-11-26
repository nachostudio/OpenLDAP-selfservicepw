# OpenLDAP-Self Service Password
## This is a docker container for Self Service Password.

Usage:
```
docker run -p 80:80 creecros/OpenLDAP-selfservicepw
```

**Once running, you will need to setup the config file to connect to your OpenLDAP server.
Configuration file: /var/www/html/conf/config.inc.php**

## Server address
Use an LDAP URI to configure the location of your LDAP server in $ldap_url:
```
$ldap_url = "ldap://localhost:389";
```
You can set several URI, so that next server will be tried if the previous is down:
```
$ldap_url = "ldap://server1 ldap://server2";
```
To use SSL, set ldaps in the URI:
```
$ldap_url = "ldaps://localhost";
```
To use StartTLS, set true in $ldap_starttls:
```
$ldap_starttls = true;
```
## Credentials
Configure DN and password in $ldap_bindn and $ldap_bindpw:
```
$ldap_binddn = "cn=manager,dc=example,dc=com";
```
```
$ldap_bindpw = "secret";
```
You can leave these parameters empty to bind anonymously. In this case, the password modification must be done with user's credentials.
To use user's credentials when writing in LDAP directory, replace manager with user in $who_change_password:
```
$who_change_password = "user";
```
## Search parameters
You can set the base of the search in $ldap_base:
```
$ldap_base = "dc=example,dc=com";
```
The filter can be set in $ldap_filter:
```
$ldap_filter = "(&(objectClass=person)(uid={login}))";
```
The string ```{login}``` is replaced by submitted login.

**_For more info on Self Service Password visit https://github.com/ltb-project/self-service-password
