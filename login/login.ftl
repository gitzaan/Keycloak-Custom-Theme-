<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        Siveillance Access

    <#elseif section = "form">
        <div class="auth-intro">
            <p>${msg("protectedByKeycloak")}</p>
        </div>



       
        <div id="kc-form" class="form-wrapper">
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                <div class="form-group">
                    <label for="username" class="control-label">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <div class="input-group">
                        <span class="input-icon user-icon"></span>
                        <input tabindex="1" id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                    </div>
                </div>

                <div class="form-group">
                    <div class="label-wrapper">
                        <label for="password" class="control-label">${msg("password")}</label>
                        <#if realm.resetPasswordAllowed>
                            <a tabindex="5" class="forgot-link" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
                        </#if>
                    </div>
                    <div class="input-group">
                        <span class="input-icon password-icon"></span>
                        <input tabindex="2" id="password" class="form-control" name="password" type="password" autocomplete="off" />
                        <button type="button" id="toggle-password" class="password-toggle" aria-label="Show password">
                            <span class="eye-icon"></span>
                        </button>
                    </div>
                </div>

                <#if realm.rememberMe && !usernameEditDisabled??>
                    <div class="form-group remember-group">
                        <label class="checkbox">
                            <#if login.rememberMe??>
                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> 
                            <#else>
                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> 
                            </#if>
                            <span class="checkbox-text">${msg("rememberMe")}</span>
                        </label>
                    </div>
                </#if>

                <div id="kc-form-buttons" class="form-group">
                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <input tabindex="4" class="login-btn" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                </div>

                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <div class="register-link">
                        ${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a>
                    </div>
                </#if>
            </form>

            <#if realm.password && social.providers??>

            <#if social.providers?size gt 0>
                <div class="separator">
                    <span class="separator-text">OR</span>
                </div>
            </#if>

            <div id="kc-social-providers" class="social-providers">
                <#list social.providers as p>
                    <a href="${p.loginUrl}" id="zocial-${p.alias}" class="social-link ${p.providerId}">
                        ${msg("doLogIn")} with ${p.displayName}
                    </a>
                </#list>
            </div>
        </#if>
        
        </div>

         
    </#if>
</@layout.registrationLayout>