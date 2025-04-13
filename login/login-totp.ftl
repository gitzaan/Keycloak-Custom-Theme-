<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <div class="form-wrapper">
            <p class="instruction">${msg("loginTotpOneTime")}</p>
            
            <form id="kc-totp-login-form" action="${url.loginAction}" method="post">
                <div class="form-group otp-group">
                    <label for="totp" class="control-label">${msg("loginTotpOneTime")}</label>
                    <div class="otp-container">
                        <input type="text" id="totp" name="totp" inputmode="numeric" 
                            autocomplete="one-time-code" class="form-control otp-input" 
                            pattern="[0-9]*" maxlength="6" autofocus />
                        
                        <div class="otp-cells">
                            <div class="otp-cell"></div>
                            <div class="otp-cell"></div>
                            <div class="otp-cell"></div>
                            <div class="otp-cell"></div>
                            <div class="otp-cell"></div>
                            <div class="otp-cell"></div>
                        </div>
                    </div>
                </div>
                
                <div id="kc-form-buttons" class="form-group">
                    <input class="login-btn" name="login" id="kc-login" type="submit" value="${msg("doSubmit")}"/>
                </div>
                
                <div class="back-link-container">
                    <a href="${url.loginUrl}" class="back-link">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>