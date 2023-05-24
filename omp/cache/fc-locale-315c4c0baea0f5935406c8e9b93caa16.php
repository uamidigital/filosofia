<?php return array (
  'plugins.importexport.users.displayName' => 'Complemeto XML de usuarios',
  'plugins.importexport.users.description' => 'Importar y exportar usuarios/as',
  'plugins.importexport.users.cliUsage' => 'Uso: {$scriptName} {$pluginName} [command] ...
Comandos:
	import [xmlFileName] [press_path] [optional flags]
	export [xmlFileName] [press_path]
	export [xmlFileName] [press_path] [role_path1] [role_path2] ...

Indicadores opcionales:
	continue_on_error: Si se ha indicado, no detenga el proceso de importación de usuarios/as si se produce un error

	send_notify: Si se ha indicado, manda correos electrónicos de notificación con los nombres de usuario/a
		y contraseñas a los usuarios/as importados

Ejemplos:
	Importar usuarios/as a miPublicación desde miFichero.xml, sin parar cuando ocurra un error:
	{$scriptName} {$pluginName} importar miFichero.xml miEditorial continue_on_error

	Exportar todos los usuarios/as de miPublicación:
	{$scriptName} {$pluginName} exportar miExportacion.xml miPublicación

	Exportar todos los usuarios/as registrados como revisores/as, solo con sus funciones de revisión:
	{$scriptName} {$pluginName} exportar miExportacion.xml revisor de miPublicación
',
  'plugins.importexport.users.import.importUsers' => 'Importar usuarios',
  'plugins.importexport.users.import.instructions' => 'Seleccione un archivo de datos XML que contenga la información de los usuario/as que quiera importar a la publicación. Consulte la ayuda para conocer los detalles del formato de este archivo.<br /><br />Tenga en cuenta que si el fichero importado contiene nombres de usuario/a o direcciones de correo electrónico que ya existan en el sistema, no se importarán los datos de esos usuarios y los nuevos roles que se creen se asignarán a los usuarios/as existentes.',
  'plugins.importexport.users.import.dataFile' => 'Fichero de datos de usuario',
  'plugins.importexport.users.import.sendNotify' => 'Enviar un correo electrónico de notificación a cada usuarios importados con su nombre de usuario y contraseña.',
  'plugins.importexport.users.import.continueOnError' => 'Continuar importando el resto de usuarios si se produce un error.',
  'plugins.importexport.users.import.usersWereImported' => 'Los siguientes usuarios se han importado correctamente en el sistema',
  'plugins.importexport.users.import.errorsOccurred' => 'Se han producido errores durante la importación',
  'plugins.importexport.users.import.confirmUsers' => 'Confirme que estos son los usuarios que desea importar en el sistema',
  'plugins.importexport.users.unknownPress' => 'Se ha especificado una ruta desconocida "{$contextPath}".',
  'plugins.importexport.users.export.exportUsers' => 'Exportar usuarios',
  'plugins.importexport.users.export.exportByRole' => 'Exportar por función',
  'plugins.importexport.users.export.exportAllUsers' => 'Exportar todo',
  'plugins.importexport.users.export.errorsOccurred' => 'Se han producido errores durante la exportación',
  'plugins.importexport.users.import.warning' => 'Aviso',
  'plugins.importexport.users.import.encryptionMismatch' => 'No es posible usar contraseñas codificadas con {$importHash}; OMP está configurado para utilizar {$ompHash}. Si decide continuar, necesitará restablecer las contraseñas de los usuarios importados.',
  'plugins.importexport.users.uploadFile' => 'Cargue un archivo en "Importar" para continuar.',
  'plugins.importexport.users.results' => 'Resultados',
  'plugins.importexport.users.importComplete' => 'La importación se completó con éxito. Los usuarios con nombres de usuario y direcciones de correo electrónico que aún no están en uso se han importado, junto con los consiguientes grupos de usuarios.',
);