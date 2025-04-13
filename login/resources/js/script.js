document.addEventListener('DOMContentLoaded', function() {
    
    var registerForm = document.getElementById('kc-register-form');
    if (registerForm) {
        registerForm.addEventListener('submit', function(e) {
            var password = document.getElementById('password').value;
            var passwordConfirm = document.getElementById('password-confirm').value;
            
            if (password && passwordConfirm && password !== passwordConfirm) {
                e.preventDefault();
                
                
                var errorSpan = document.querySelector('.password-confirm-error');
                if (!errorSpan) {
                    errorSpan = document.createElement('span');
                    errorSpan.className = 'error-message password-confirm-error';
                    errorSpan.textContent = 'Passwords don\'t match';
                    document.getElementById('password-confirm').parentNode.appendChild(errorSpan);
                }
                
                document.getElementById('password-confirm').setAttribute('aria-invalid', 'true');
            }
        });
        
       
        var passwordField = document.getElementById('password');
        if (passwordField) {
            passwordField.addEventListener('input', function() {
                
                let strength = 0;
                if (this.value.length >= 8) strength += 1;
                if (/[A-Z]/.test(this.value)) strength += 1;
                if (/[0-9]/.test(this.value)) strength += 1;
                if (/[^A-Za-z0-9]/.test(this.value)) strength += 1;
                
                
                let strengthIndicator = document.querySelector('.password-strength');
                if (!strengthIndicator) {
                    strengthIndicator = document.createElement('div');
                    strengthIndicator.className = 'password-strength';
                    this.parentNode.appendChild(strengthIndicator);
                }
                
                
                strengthIndicator.className = 'password-strength';
                strengthIndicator.classList.add('strength-' + strength);
                
                
                const descriptions = ['Weak', 'Fair', 'Good', 'Strong'];
                if (this.value) {
                    strengthIndicator.textContent = descriptions[strength - 1] || 'Too weak';
                } else {
                    strengthIndicator.textContent = '';
                }
            });
        }
    }
    
    
    var togglePasswordBtn = document.getElementById('toggle-password');
    if (togglePasswordBtn) {
        togglePasswordBtn.addEventListener('click', function() {
            var passwordInput = document.getElementById('password');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                this.setAttribute('aria-label', 'Hide password');
                this.classList.add('showing');
            } else {
                passwordInput.type = 'password';
                this.setAttribute('aria-label', 'Show password');
                this.classList.remove('showing');
            }
        });
    }
    
    
    var otpInput = document.getElementById('totp');
    if (otpInput) {
        otpInput.addEventListener('input', function() {
           
            this.value = this.value.replace(/\D/g, '').substring(0, 6);
            
            
            const cells = document.querySelectorAll('.otp-cell');
            for (let i = 0; i < cells.length; i++) {
                if (i < this.value.length) {
                    cells[i].style.borderColor = 'rgba(23, 212, 212, 0.8)';
                } else {
                    cells[i].style.borderColor = 'rgba(255, 255, 255, 0.3)';
                }
            }
            
           
            if (this.value.length === 6 && document.getElementById('kc-login')) {
                
                setTimeout(() => {
                    document.getElementById('kc-login').classList.add('loading');
                }, 300);
                
                setTimeout(() => {
                    document.getElementById('kc-totp-login-form').submit();
                }, 800);
            }
        });
    }
    
   
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function() {
            const submitBtn = this.querySelector('input[type="submit"]');
            if (submitBtn) {
                submitBtn.classList.add('loading');
                submitBtn.disabled = true;
            }
        });
    });
});