{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * User login form.
 *
 *}

{include file="frontend/components/header.tpl" pageTitle="user.login"}

<div class="cajon">

<div class="page page_login entrar form-body">
<div class="degradado">
<h1></h1>
</div>
<div class="login-derecha">
	{include file="frontend/components/breadcrumbs.tpl" currentTitleKey="user.login"}
	<h1 class="entrar">
			Iniciar sesión
	</h1>
	
	{* A login message may be displayed if the user was redireceted to the
	   login page from another request. Examples include if login is required
	   before dowloading a file. *}
	{if $loginMessage}
		<p>
			{translate key=$loginMessage}
		</p>
	{/if}

	<form class="cmp_form cmp_form login" id="login" method="post" action="{$loginUrl}">
		{csrf}

		{if $error}
			<div class="pkp_form_error">
				{translate key=$error reason=$reason}
			</div>
		{/if}

		<input type="hidden" name="source" value="{$source|default:""|escape}" />

		<fieldset class="fields">
			<legend class="pkp_screen_reader">{translate key="user.login"}</legend>
			<div class="username">
				<label>
				
					<input type="text" name="username" id="username" value="{$username|default:""|escape}" maxlength="32" required aria-required="true" placeholder="Ingrese nombre de usuario">
				</label>
			</div>
			<div class="password">
				<label>
					
					<input type="password" name="password" id="password" value="{$password|default:""|escape}" password="true" maxlength="32" required aria-required="true" placeholder="Ingrese contraseña">
					<br>
					<a class="olvidado-contraseña" href="{url page="login" op="lostPassword"}">
						{translate key="user.login.forgotPassword"}
					</a>
				</label>
			</div>

			<div class="remember checkbox">
				<label>
					<input type="checkbox" name="remember" id="remember" value="1" checked="$remember class="che">
					<span class="conectado">
						{translate key="user.login.rememberUsernameAndPassword"}
					</span>
				</label>
			</div>
			
			<div class="boton btn-entrar">
				<button class="submit" type="submit">
					{translate key="user.login"}
				</button>

				{if !$disableUserReg}
					{capture assign=registerUrl}{url page="user" op="register" source=$source}{/capture}
					<a href="{$registerUrl}" class="register registrarse">
						{translate key="user.login.registerNewAccount"}
					</a>
				{/if}
				
			</div>
</div>


			
		</fieldset>
		
	</form>
	</div>
	
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
