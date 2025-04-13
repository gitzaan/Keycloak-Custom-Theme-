<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div class="form-wrapper">
            <p class="instruction">${msg("Instructions about password reset will be sent to your registered email.")}</p>
            
            <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
                <div class="form-group">
                    <label for="username" class="control-label">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <div class="input-group">
                        <span class="input-icon user-icon"></span>
                        <input type="text" id="username" name="username" class="form-control" autofocus value="${(auth.attemptedUsername!'')}" />
                    </div>
                </div>

                <div class="action-buttons">
                    <input class="login-btn" type="submit" value="${msg("doSubmit")}"/>
                    <a href="${url.loginUrl}" class="btn-secondary">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                </div>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>