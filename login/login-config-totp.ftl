<#import "template.ftl" as layout>
<@layout.registrationLayout displayRequiredFields=false; section>
    <#if section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "form">
        <p>${msg("loginTotpIntro")}</p>
        
        <ol id="kc-totp-settings">
            <li>
                <p>${msg("loginTotpStep1")}</p>
                <ul id="kc-totp-supported-apps">
                    <#-- Fix for the error - add safe navigation operators -->
                    <#if totp.policy?? && totp.policy.supportedApplications?? && totp.policy.supportedApplications?has_content>
                        <#list totp.policy.supportedApplications as app>
                            <li>${app}</li>
                        </#list>
                    <#else>
                        <li>Google Authenticator</li>
                        <li>Microsoft Authenticator</li>
                        <li>FreeOTP</li>
                        <li>Authy</li>
                    </#if>
                </ul>
            </li>

            <li>
                <p>${msg("loginTotpStep2")}</p>
                <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="QR Code" />
                <p class="manual-setup">${msg("loginTotpManualStep2")} <span id="kc-totp-secret-key">${totp.totpSecretEncoded}</span></p>
            </li>

            <li>
                <p>${msg("loginTotpStep3")}</p>
            </li>
        </ol>

        <form action="${url.loginAction}" id="kc-totp-settings-form" method="post">
            <div class="form-group">
                <label for="totp" class="control-label">${msg("authenticatorCode")}</label>
                <input type="text" id="totp" name="totp" autocomplete="off" class="form-control" autofocus />
            </div>

            <div class="form-group">
                <label for="userLabel" class="control-label">${msg("loginTotpDeviceName")}</label>
                <input type="text" id="userLabel" name="userLabel" autocomplete="off" class="form-control" />
            </div>

            <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />

            <div class="form-group">
                <input class="login-btn" type="submit" value="${msg("doSubmit")}" />
                <#if isAppInitiatedAction??>
                    <button type="submit" class="btn-cancel" name="cancel-aia" value="true">${msg("doCancel")}</button>
                </#if>
            </div>
        </form>
    </#if>
</@layout.registrationLayout>