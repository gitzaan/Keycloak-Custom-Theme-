<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false showAnotherWayIfPresent=true>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Siemens Siveillance Access</title>
    <link rel="icon" type="image/x-icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>
<body>
    <a href="#content" class="skip-link">Skip to content</a>
    
    <div class="login-container">
        <div class="left-panel">
            <div class="logo">SIEMENS</div>
            
            <div class="content-wrapper">
                <div id="content" class="content">
                    <h1><#nested "header"></h1>
                    
                    <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                        <div class="alert alert-${message.type}">
                            <span class="message-text">${kcSanitize(message.summary)?no_esc}</span>
                        </div>
                    </#if>
                    
                    <div class="accent-line"></div>
                    
                    <#nested "form">
                </div>
            </div>
            
            <div class="footer">
                <a href="http://www.siemens.com/corporate-information">Corporate Information</a>
                <a href="http://www.siemens.com/privacy-notice">Privacy Policy</a>
                <a href="http://www.siemens.com/terms-of-use">Terms of Use</a>
            </div>
        </div>
        
        <div class="right-panel">
            <!-- Background image handled in CSS -->
        </div>
    </div>
    
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
</body>
</html>
</#macro>