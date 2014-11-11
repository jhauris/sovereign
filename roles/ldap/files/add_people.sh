#!/bin/sh

LDAP_ADMIN_CN=$1
LDAP_ADMIN_PW=$2
LDAP_BASE_DN=$3
LDAP_HOST=$4

LDIF_FILE=/tmp/people.ldif

cat > "${LDIF_FILE}" << EOM
dn: ou=people,${LDAP_BASE_DN}
objectClass: top
objectClass: organizationalUnit
EOM

ldapadd -H "ldap://${LDAP_HOST}" -D "cn=$LDAP_ADMIN_CN,$LDAP_BASE_DN" -w "$LDAP_ADMIN_PW" -f "$LDIF_FILE"

rm "$LDIF_FILE"

