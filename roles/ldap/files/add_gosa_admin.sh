#!/bin/sh

LDAP_ADMIN_CN=$1
LDAP_ADMIN_PW=$2
LDAP_BASE_DN=$3
GOSA_ADMIN_UID=$4
LDAP_HOST=$5

LDIF_FILE=/tmp/gosa-admin.ldif

cat > "${LDIF_FILE}" << EOM
# GOSa system admin
dn: cn=System Administrator-${GOSA_ADMIN_UID},ou=people,${LDAP_BASE_DN}
givenName: System
sn: Administrator
cn: System Administrator-${GOSA_ADMIN_UID}
uid: ${GOSA_ADMIN_UID}
objectClass: top
objectClass: person
objectClass: gosaAccount
objectClass: organizationalPerson
objectClass: inetOrgPerson
EOM

ldapadd -H "ldap://${LDAP_HOST}" -D "cn=$LDAP_ADMIN_CN,$LDAP_BASE_DN" -w "$LDAP_ADMIN_PW" -f "$LDIF_FILE"

rm "$LDIF_FILE"

