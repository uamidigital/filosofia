<?php return array (
  'plugins.importexport.csv.import.success.description' => 'La importación se llevó a cabo con éxito. Los elementos importados correctamente se muestran a continuación.',
  'plugins.importexport.csv.import.submission' => 'Envío: \'{$title}\' importado correctamente.',
  'plugins.importexport.csv.noSeries' => 'La ruta de series {$seriesPath} no existe. Imposible añadirla a este envío.',
  'plugins.importexport.csv.noAuthorGroup' => 'No hay un grupo de autores/as predeterminado en la publicación {$press}. Omitiendo este envío.',
  'plugins.importexport.csv.noGenre' => 'No hay género de manuscrito. Saliendo.',
  'plugins.importexport.csv.unknownPress' => 'Editorial desconocida: "{$contextPath}". Omitiendo.',
  'plugins.importexport.csv.unknownLocale' => 'Configuración regional desconocida: "{$locale}". Omitiendo.',
  'plugins.importexport.csv.unknownUser' => 'Usuario/a desconocido: "{$username}". Saliendo.',
  'plugins.importexport.csv.fileDoesNotExist' => 'El archivo "{$filename}" no existe. Saliendo.',
  'plugins.importexport.csv.cliUsage' => 'Herramienta de línea de comandos para importar datos CSV a OMP
			Uso:
			{$scriptName} [--dry-run] fileName.csv username
			La opción --dry-run puede utilizarse para hacer pruebas sin realizar cambios.
			Especifique el nombre de usuario/a que quiera asignar a los envíos.
',
  'plugins.importexport.csv.cliOnly' => '
		<p>Actualmente este módulo solo es compatible con operaciones de líneas de comando. Ejecute...
			<pre>php tools/importExport.php CSVImportExportPlugin</pre>
			... para obtener más información.</p>
	',
  'plugins.importexport.csv.description' => 'Importar envíos en las publicaciones desde datos delimitados por tabuladores.',
  'plugins.importexport.csv.displayName' => 'Módulo de importación de contenido delimitado por tabuladores',
);