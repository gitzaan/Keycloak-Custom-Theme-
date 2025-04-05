<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <p>${msg("Please Enter the OTP from the Authenticator App")}</p>
        
        <form id="kc-otp-login-form" action="${url.loginAction}" method="post">
            <div class="form-group">
                <label for="otp" class="control-label">${msg("loginOtpOneTime")}</label>
                <input type="text" id="otp" name="otp" autocomplete="off" class="form-control" autofocus />
            </div>
            
            <div id="kc-form-buttons" class="form-group">
                <input class="login-btn" name="login" id="kc-login" type="submit" value="${msg("doSubmit")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>