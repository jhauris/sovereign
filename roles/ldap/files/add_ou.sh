#!/bin/sh

LDAP_ADMIN_CN=$1
LDAP_ADMIN_PW=$2
LDAP_BASE_DN=$3
LDAP_HOST=$4
OU=$5
DN=$6

LDIF_FILE=/tmp/new_ou_${OU}.ldif

cat > "${LDIF_FILE}" << EOM
dn: $DN
objectClass: organizationalUnit
ou: $OU
EOM

ldapadd -H "ldap://${LDAP_HOST}" -D "cn=$LDAP_ADMIN_CN,$LDAP_BASE_DN" -w "$LDAP_ADMIN_PW" -f "$LDIF_FILE"

rm "$LDIF_FILE"

