<?php return array (
  'plugins.generic.usageStats.settings.logging' => 'Options de la journalisation des accès',
  'plugins.generic.usageStats.settings.createLogFiles' => 'Créer des fichiers de journalisation des événements',
  'plugins.generic.usageStats.settings.createLogFiles.description' => 'En activant cette option, le plugiciel créera des fichiers de journalisation des accès dans le répertoire de fichiers. Ces fichiers pourront être utilisés pour extraire les données de statistiques d\'utilisation. Si vous ne souhaitez plus créer de fichiers  de journalisation des accès, vous pouvez laisser cette option désactivée  et utiliser les fichiers de journalisation des accès de votre propre serveur.',
  'plugins.generic.usageStats.settings.logParseRegex' => 'Analyser les fichiers de journalisation des événements à l\'aide d\'expressions régulières',
  'plugins.generic.usageStats.settings.logParseRegex.description' => 'L\'expression régulière utilisée  par défaut peut analyser les fichiers de journalisation des accès Apache au format combiné et les fichiers de journalisation des événements du plugiciel. Si vos fichiers de journalisation des accès sont dans un format différent, vous devrez insérer une expression régulière capable de les analyser et de donner les valeurs attendues. Voir UsageStatsLoader::_ getDataFromLogEntry() pour plus de renseignements.',
  'plugins.generic.usageStats.settings.saved' => 'Paramètres du plugiciel des statistiques d\'utilisation enregistrés',
  'plugins.generic.usageStats.settings.dataPrivacyOption' => 'Option de confidentialité des données',
  'plugins.generic.usageStats.settings.dataPrivacyOption.saltFilepath' => 'Chemin d\'accès du fichier pour le salage anonymisant',
  'plugins.generic.usageStats.settings.dataPrivacyOption.saltFilepath.invalid' => 'Le fichier de salage n\'est pas accessible en écriture.',
  'plugins.generic.usageStats.settings.dataPrivacyOption.requirements' => 'Pour garantir la confidentialité des données, vous devez spécifier un fichier lisible et accessible en écriture par l\'utilisateur ou l\'utilisatrice  qui contiendra une valeur de salage générée de façon aléatoire. Ce fichier ne doit PAS être sauvegardé pour assurer la protection de la vie privée. Le  salage est généré au hasard soit en utilisant la fonction mcrypt_create_iv, qui nécessite le PHP mcrypt ; la fonction openssl_random_pseudo_bytes, qui nécessite le PHP openssl ; le fichier /dev/urandom, qui ne fonctionne que sur les systèmes * nix ; ou la fonction mt_rand, qui n\'est pas sécuritaire d\'un point de vue cryptographique. En conséquence, si vous utilisez un serveur Windows, assurez-vous d\'installer le PHP mcrypt ou openssl activé afin d\'avoir un fichier de salage généré sécuritaire d\'un point de vue cryptographique.',
  'plugins.generic.usageStats.settings.dataPrivacyOption.description' => 'Activer cette option pour utiliser une version du plugiciel qui respecte les réglementations en matière de protection de la vie privée, c\'est-à-dire enregistrant  des adresses IP hachées, informant les utilisateurs et utilisatrices du suivi et offrant à ceux-ci et celles-ci une option de retrait. Remarque : lorsque vous utilisez cette option, vous ne pourrez pas utiliser les fonctions de géolocalisation du plugiciel.',
  'plugins.generic.usageStats.settings.dataPrivacyOption.requiresSalt' => 'L\'activation de la confidentialité des données requiert un fichier de salage.',
  'plugins.generic.usageStats.settings.dataPrivacyOption.excludesCity' => 'L\'activation de la confidentialité des données exclut « Ville » comme statistique facultative.',
  'plugins.generic.usageStats.settings.dataPrivacyOption.excludesRegion' => 'L\'activation de la confidentialité des données exclut « Région » comme statistique facultative.',
  'plugins.generic.usageStats.settings.dataPrivacyCheckbox' => 'Respecter la confidentialité des données',
  'plugins.generic.usageStats.settings.optionalColumns' => 'Renseignements facultatifs sur les statistiques',
  'plugins.generic.usageStats.settings.optionalColumns.description' => 'Activer ou désactiver la collecte des informations facultatives suivantes. Cela aura une influence sur les rapports statistiques éventuels que vous pouvez récupérer et aura également un impact sur la taille de la base de données. NE PAS MODIFIER, sauf si vous comprenez parfaitement ce que vous faites.',
  'plugins.generic.usageStats.settings.optionalColumns.cityRequiresRegion' => 'La colonne facultative « Ville » requiert la colonne facultative « Région ».',
  'plugins.generic.usageStats.settings.archives' => 'Archives',
  'plugins.generic.usageStats.settings.compressArchives' => 'Compresser les archives',
  'plugins.generic.usageStats.settings.compressArchives.description' => 'Activer cette option pour compresser les fichiers archivés de journalisation des événements à l\'aide de l\'outil gzip (vous devrez configurer le paramètre gzip dans config.inc.php). Si vous avez un site à fort trafic, il serait judicieux d\'activer cette option afin d\'économiser de l\'espace disque supplémentaire.',
  'plugins.generic.usageStats.settings.statsDisplayOptions' => 'Options d\'affichage des statistiques',
  'plugins.generic.usageStats.settings.statsDisplayOptions.display' => 'Afficher le graphique des statistiques de soumission pour la lecture',
  'plugins.generic.usageStats.settings.statsDisplayOptions.chartType' => 'Choisir le type du graphique pour afficher les statistiques de téléchargement',
  'plugins.generic.usageStats.settings.statsDisplayOptions.chartType.bar' => 'Barre',
  'plugins.generic.usageStats.settings.statsDisplayOptions.chartType.line' => 'Ligne',
  'plugins.generic.usageStats.settings.statsDisplayOptions.datasetMaxCount' => 'Définir le nombre maximal de données à présenter simultanément pour un point spécifique de l\'axe des X. Une valeur plus élevée peut générer des graphiques plus ardus à comprendre. Une valeur comprise entre 3 et 5 est sécuritaire.',
  'plugins.generic.usageStats.usageStatsLoaderName' => 'Tâche de versement du fichier de statistiques d\'utilisation',
  'plugins.generic.usageStats.openFileFailed' => 'Le fichier {$file} n\'a pas pu être ouvert et a été rejeté.',
  'plugins.generic.usageStats.invalidLogEntry' => 'La ligne {$lineNumber} du fichier {$file} n\'est pas une entrée valide de journalisation des évènements. Le fichier a été rejeté.',
  'plugins.generic.usageStats.removeUrlError' => 'La ligne {$lineNumber} du fichier {$file} contient un URL dont le système ne peut pas supprimer l\'URL de base.',
  'plugins.generic.usageStats.loadDataError' => 'Impossible de charger les données extraites du fichier {$file}. Le fichier a été retourné à l\'étape précédente.',
  'plugins.generic.usageStats.pluginNotEnabled' => 'Le plugiciel de statistiques d\'utilisation est désactivé. Aucun fichier de journalisation des événements n\'a été traité.',
  'plugins.generic.usageStats.processingPathNotEmpty' => 'Le répertoire {$directory} n\'est pas vide. Cela pourrait indiquer un processus qui a échoué précédemment ou l\'existence d\'un processus en cours d\'exécution simultanée. Ce fichier sera de nouveau traité automatiquement si vous utilisez également scheduleTasksAutoStage.xml, sinon vous devrez déplacer manuellement les fichiers orphelins du répertoire de traitement vers le répertoire principal.',
  'plugins.generic.usageStats.displayName' => 'Statistiques d\'utilisation',
  'plugins.generic.usageStats.description' => 'Affiche les statistiques d\'utilisation des objets. Les fichiers de journalisation des accès du serveur peuvent être utilisés pour extraire les statistiques.',
  'plugins.reports.usageStats.report.displayName' => 'Rapport des statistiques d\'utilisation de PKP',
  'plugins.reports.usageStats.report.description' => 'Rapport des statistiques d\'utilisation par défaut de PKP (conformes à COUNTER)',
  'plugins.generic.usageStats.optout.displayName' => 'Renseignements au sujet de la confidentialité des statistiques d\'utilisation',
  'plugins.generic.usageStats.optout.description' => 'Informations sur la confidentialité des statistiques d\'utilisation',
  'plugins.generic.usageStats.optout.title' => 'Renseignements sur les statistiques d\'utilisation',
  'plugins.generic.usageStats.optout.shortDesc' => 'Les connexions anonymisées sont enregistrées dans les statistiques. Veuillez lire les <a href="{$privacyInfo}">Renseignements relatives à la confidentialité</a> pour plus de détails.',
  'plugins.generic.usageStats.optout.done' => '
		<p>Vous avez choisi de vous retirer de la collecte de statistiques d\'utilisation. Tant que vous voyez ce message, aucune mesure de votre utilisation de ce site ne sera enregistrée. Cliquer sur le bouton ci-dessous pour revenir sur votre décision.</p>',
  'plugins.generic.usageStats.optin' => 'Adhérer',
  'plugins.generic.usageStats.optout' => 'Se retirer',
  'plugins.generic.usageStats.optout.cookie' => '
		<p> Si vous le souhaitez, vous pouvez vous désinscrire du processus de collecte de données. En cliquant sur le bouton de désactivation ci-dessous, vous pouvez décider de ne pas participer à l\'analyse statistique. Lorsque vous cliquez sur le bouton de désactivation, un fichier témoin est créé sur votre système pour enregistrer votre décision. Si les paramètres de confidentialité de votre navigateur entraînent la suppression automatique des fichiers témoins, vous devrez vous désinscrire à nouveau la prochaine fois que vous accéderez à ce site. Le fichier témoin est valide uniquement pour un navigateur donné. Si vous utilisez un autre navigateur, vous devrez vous désinscrire à nouveau. Aucune information individuelle n\'est stockée dans ce fichier témoin. La durée de validité du fichier témoin est d\'un an après votre dernier accès. </p>
		<p> Veuillez noter que les fichiers de journalisation d\'événements généraux du serveur ne sont pas affectés par votre décision de vous retirer du processus d\'évaluation détaillé. Veuillez vous reporter à notre <a href="{$privacyStatementUrl}">politique de confidentialité </a> générale. </p>',
  'plugins.reports.usageStats.metricType' => 'PKP/COUNTER',
  'plugins.reports.usageStats.metricType.full' => 'Statistiques Public Knowledge Project (conformes à COUNTER)',
  'plugins.generic.usageStats.statsSum' => 'Somme de l’ensemble des téléchargements de fichiers',
  'plugins.generic.usageStats.noStats' => 'Les données relatives au téléchargement ne sont pas encore disponibles.',
  'plugins.generic.usageStats.monthInitials' => 'Jan Fév Mar Avr Mai Juin Juil Aoû Sep Oct Nov Déc',
  'plugins.generic.usageStats.downloads' => 'Téléchargements',
  'plugins.generic.usageStats.settings.statsDisplayOptions.contextWide' => 'Ces paramètres ne seront appliqués qu\'aux statistiques d\'utilisation de {$contextName}.',
  'plugins.generic.usageStats.optout.description.long.ojs2' => '
		<h3>Information relatives à la protection de la vie privée</h3>
		<p>Veuillez vous référer à notre <a href="{$privacyStatementUrl}">politique de confidentialité</a>.</p>
		<h3>Statistiques d\'utilisation</h3>
		<p>Afin d\'analyser l\'utilisation et l\'impact de notre revue et de ses articles,  nous mesurons et enregistrons les accès à la page d\'accueil, aux catégories, aux collections, aux livres et aux fichiers. Toute information est enregistrée de manière anonyme. Aucune information personnelle ou permettant d\'identifier un utilisateur ou une utilisatrice n\'est conservée. Les adresses IP sont anonymisées selon un hachage <em>SHA 256</em> en utilisant un <em>salage sécurisé de 64 caractères</em> qui est automatiquement <em>régénéré de façon aléatoire et remplacé quotidiennement</em>. Il est donc impossible de reconstruire les adresses IP une fois qu\'elles ont été hachées.</p>
		<p>Les renseignements suivants sont enregistrés de concert avec les adresses IP anonymisées :</p>
		<ul>
		<li>Type d\'accès (administratif)</li>
		<li>Heure de la requête</li>
		<li>URL demandé</li>
		<li>Code de la réponse HTTP</li>
		<li>Navigateur</li>
		</ul>
		<p>Les données sont uniquement enregistrées dans un but d\'évaluation. Aucune adresse IP n\'est associée aux identifiants des utilisateurs et utilisatrices. Il est impossible d\'associer quelque donnée que ce soit à une adresse IP donnée.</p>',
  'plugins.generic.usageStats.settings.statsDisplayOptions.siteWide.ojs2' => 'Chaque revue peut remplacer ces paramètres depuis la page des plugiciels de la revue.',
  'plugins.generic.usageStats.optout.description.long.omp' => '
		<h3>Information relatives à la protection de la vie privée</h3>
		<p>Veuillez vous référer à notre <a href="{$privacyStatementUrl}">politique de confidentialité</a>.</p>
		<h3>Statistiques d\'utilisation</h3>
		<p>Afin d\'analyser l\'utilisation et l\'impact de notre revue et de ses articles,  nous mesurons et enregistrons les accès à la page d\'accueil, aux catégories, aux collections, aux livres et aux fichiers. Toute information est enregistrée de manière anonyme. Aucune information personnelle ou permettant d\'identifier un utilisateur ou une utilisatrice n\'est conservée. Les adresses IP sont anonymisées selon un hachage <em>SHA 256</em> en utilisant un <em>salage sécurisé de 64 caractères</em> qui est automatiquement <em>régénéré de façon aléatoire et remplacé quotidiennement</em>. Il est donc impossible de reconstruire les adresses IP une fois qu\'elles ont été hachées.</p>
		<p>Les renseignements suivants sont enregistrés de concert avec les adresses IP anonymisées :</p>
		<ul>
		<li>Type d\'accès (administratif)</li>
		<li>Heure de la requête</li>
		<li>URL demandé</li>
		<li>Code de la réponse HTTP</li>
		<li>Navigateur</li>
		</ul>
		<p>Les données sont uniquement enregistrées dans un but d\'évaluation. Aucune adresse IP n\'est associée aux identifiants des utilisateurs et utilisatrices. Il est impossible d\'associer quelque donnée que ce soit à une adresse IP donnée.</p>',
  'plugins.generic.usageStats.settings.statsDisplayOptions.siteWide.omp' => 'Chaque presse peut remplacer ces paramètres depuis la page des plugiciels de la presse.',
);