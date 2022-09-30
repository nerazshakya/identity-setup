#!/bin/sh/env bash
grep -v '^#' .env
export $(grep -v '^#' .env | xargs)
adminconfig='{

    "Urls":  "${CONTAINER_ADMIN_URL_PORT}",
    "PATHBASE": "",
    "ConnectionStrings": {
      "ConfigurationDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
      "PersistedGrantDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
      "IdentityDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
      "AdminLogDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
      "AdminAuditLogDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};"
    },
    "DatabaseProviderConfiguration": {
      "ProviderType": "${DB_PLATFORM}"
    },
    "AdminConfiguration": {
      "PageTitle": "BitsKraft Identity Admin",
      "FaviconUri": "/favicon.ico",
      "IdentityAdminRedirectUri": "${IS_ADMIN_REDIRECT_URL}",
      "IdentityServerBaseUrl": "${IS_STS_SERVRER_URL}",
      "IdentityAdminCookieName": "IdentityServerAdmin",
      "IdentityAdminCookieExpiresUtcHours": 12,
      "RequireHttpsMetadata": false,
      "TokenValidationClaimName": "name",
      "TokenValidationClaimRole": "role",
      "ClientId": "DctIdentityAdminClientId",
      "ClientSecret": "DctIdentityAdminClientSecret",
      "OidcResponseType": "code id_token",
      "Scopes": [
        "openid",
        "profile",
        "email",
        "roles"
      ],
      "AdministrationRole": "Administrator"
      },
    "AuditLoggingConfiguration": {
      "Source": "IdentityServer.Admin.Web",
      "SubjectIdentifierClaim": "sub",
      "SubjectNameClaim": "name",
      "IncludeFormVariables": false
    },
    "CultureConfiguration": {
      "Cultures": [],
      "DefaultCulture": null
    }
  }
  '
  apiconfig='{

    "Urls":  "${CONTAINER_API_URL_PORT}",
    "PATHBASE": "",
    "ConnectionStrings": {
        "ConfigurationDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
        "PersistedGrantDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
        "IdentityDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
        "AdminLogDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
        "AdminAuditLogDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};"
      },
    "DatabaseProviderConfiguration": {
      "ProviderType": "${DB_PLATFORM}"
    },
    "AdminConfiguration": {
      "PageTitle": "BitsKraft Identity API",
      "FaviconUri": "/favicon.ico",
      "IdentityAdminRedirectUri": "${IS_ADMIN_REDIRECT_URL}",
      "IdentityServerBaseUrl": "${IS_STS_SERVRER_URL}",
      "IdentityAdminCookieName": "IdentityServerAdmin",
      "IdentityAdminCookieExpiresUtcHours": 12,
      "RequireHttpsMetadata": false,
      "TokenValidationClaimName": "name",
      "TokenValidationClaimRole": "role",
      "ClientId": "DctIdentityAdminClientId",
      "ClientSecret": "DctIdentityAdminClientSecret",
      "OidcResponseType": "code id_token",
      "Scopes": [
        "openid",
        "profile",
        "email",
        "roles"
      ],
      "AdministrationRole": "Administrator"
      },
    "AuditLoggingConfiguration": {
      "Source": "IdentityServer.Admin.Web",
      "SubjectIdentifierClaim": "sub",
      "SubjectNameClaim": "name",
      "IncludeFormVariables": false
    },
    "CultureConfiguration": {
      "Cultures": [],
      "DefaultCulture": null
    }
  }
  '
  stsconfig='{ 
    "Urls": "${CONTAINER_STS_URL_PORT}", 
    "ConnectionStrings": { 
        "ConfigurationDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
        "PersistedGrantDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
        "IdentityDbConnection": "Server=${DB_SERVER_URL};Port=${POSTGRES_DB_PORT};Database=${DB_NAME};User ID=${DB_USER_NAME};Password=${DB_USER_PWD};",
    }, 
    "DatabaseProviderConfiguration": { 
        "ProviderType": "${DB_PLATFORM}"
    }, 
    "CertificateConfiguration": { 
        "UseTemporarySigningKeyForDevelopment": true, 
        "CertificateStoreLocation": "LocalMachine", 
        "CertificateValidOnly": true, 
        "UseSigningCertificateThumbprint": false, 
        "SigningCertificateThumbprint": "", 
        "UseSigningCertificatePfxFile": false, 
        "SigningCertificatePfxFilePath": "", 
        "SigningCertificatePfxFilePassword": "", 
        "UseValidationCertificatePfxFile": false, 
        "ValidationCertificatePfxFilePath": "", 
        "ValidationCertificatePfxFilePassword": "", 
        "UseValidationCertificateThumbprint": false, 
        "ValidationCertificateThumbprint": "" 
    },  
    "RegisterConfiguration": { 
        "Enabled": false 
    }, 
    "ExternalProvidersConfiguration": { 
        "UseGitHubProvider": false, 
        "GitHubClientId": "", 
        "GitHubClientSecret": "" 
    },
    "SmtpConfiguration": { 
        "Host": "", 
        "Login": "", 
        "Password": "" 
    }, 
    "SendgridConfiguration": { 
        "ApiKey": "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*******", 
        "SourceEmail": "paperplate@codentonic.com", 
        "SourceName": "PaperPlate Admin" 
    }, 
    "LoginConfiguration": { 
        "ResolutionPolicy": "Username" 
    }, "AdminConfiguration": { 
        "PageTitle": "BitsKraft Identity", 
        "HomePageLogoUri": "/images/dct.png", 
        "FaviconUri": "/favicon.ico", 
        "IdentityAdminBaseUrl": "${IS_ADMIN_SERVRER_URL}", 
        "AdministrationRole": "Administrator"
    }, "CultureConfiguration": { 
        "Cultures": [], 
        "DefaultCulture": null 
    } 
}
'

echo $stsconfig > ${PWD}/config/sts/appsettings.json
echo $adminconfig > ${PWD}/config/admin/appsettings.json
echo $apiconfig > ${PWD}/config/api/appsettings.json