<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <form id="kc-totp-login-form" action="${url.loginAction}" method="post">
            <div class="form-group">
                <label for="totp" class="control-label">${msg("loginTotpOneTime")}</label>
                <input tabindex="1" id="totp" name="totp" type="text" inputmode="numeric" pattern="[0-9]*" class="form-control" autocomplete="off" autofocus />
            </div>

            <div id="kc-form-buttons" class="form-group">
                <input tabindex="2" class="login-btn" name="login" id="kc-login" type="submit" value="${msg("doSubmit")}"/>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>