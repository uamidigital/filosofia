<?php return array (
  'emails.notification.subject' => 'Nouvelle notification de {$siteTitle}',
  'emails.notification.body' => 'Vous avez reçu une nouvelle notification de {$siteTitle}:<br />
<br />
{$notificationContents}<br />
<br />
Lien: {$url}<br />
<br />
{$principalContactSignature}',
  'emails.notification.description' => 'Ce courriel est envoyé aux utilisateurs qui ont demandé qu\'on leur envoie ce type de notification par courriel.',
  'emails.passwordResetConfirm.subject' => 'Confirmation de réinitialisation du mot de passe',
  'emails.passwordResetConfirm.body' => 'Nous avons reçu une requête de réinitialisation de votre mot de passe pour le site Web {$siteTitle}.<br />
<br />
Si vous n\'avez pas fait cette requête, veuillez ignorer ce courriel et votre mot de passe demeurera le même. Si vous souhaitez modifier votre mot de passe, cliquez sur l\'adresse URL ci-dessous.<br />
<br />
Modifier mon mot de passe: {$url}<br />
<br />
{$principalContactSignature}',
  'emails.passwordResetConfirm.description' => 'Ce courriel est envoyé à un utilisateur lorsqu\'il a indiqué avoir oublié son mot de passe ou être incapable d\'ouvrir une session. On lui fournit une adresse URL sur laquelle il peut cliquer pour modifier son mot de passe.',
  'emails.passwordReset.subject' => 'Réinitialisation du mot de passe',
  'emails.passwordReset.body' => 'Votre mot de passe vous permettant d\'avoir accès au site Web {$siteTitle} a été réinitialisé. Veuillez noter votre nom d\'utilisateur et mot de passe dans vos dossiers, car vous en aurez besoin pour vos travaux auprès de la presse.<br />
<br />
Votre nom d\'utilisateur: {$username}<br />
Votre nouveau mot de passe: {$password}<br />
<br />
{$principalContactSignature}',
  'emails.passwordReset.description' => 'Ce courriel est envoyé à un utilisateur lorsque son mot de passe a été réinitialisé après avoir suivi les instructions du courriel "PASSWORD_RESET_CONFIRM".',
  'emails.userRegister.subject' => 'Inscription à la presse',
  'emails.userRegister.body' => '{$userFullName}<br />
<br />
Vous êtes désormais inscrit à la presse {$contextName}. Ce courriel contient votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin pour tous vos travaux au sein de la presse. Vous pouvez demander que l\'on retire votre nom de la liste des utilisateurs en tout temps. Il suffit de me contacter.<br />
<br />
<br />
Nom d\'utilisateur: {$username}<br />
Mot de passe: {$password}<br />
<br />
Merci,<br />
{$principalContactSignature}',
  'emails.userRegister.description' => 'Ce courriel est envoyé à un nouvel utilisateur afin de lui souhaiter la bienvenue dans le système et lui fournir son nom d\'utilisateur et son mot de passe pour ses dossiers.',
  'emails.userValidate.subject' => 'Valider votre compte',
  'emails.userValidate.body' => '{$userFullName}<br />
<br />
Vous avez ouvert un compte chez {$contextName}. Mais avant de pouvoir l\'utiliser, vous devez confirmer votre adresse courriel. Il suffit de cliquer sur le lien ci-dessous.<br />
<br />
<br />
{$activateUrl}<br />
<br />
Merci,<br />
{$principalContactSignature}',
  'emails.userValidate.description' => 'Ce courriel est envoyé à un nouvel utilisateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.',
  'emails.reviewerRegister.subject' => 'Inscription à titre d\'évaluateur pour la presse {$contextName}',
  'emails.reviewerRegister.body' => 'En raison de votre expertise, nous avons ajouté votre nom à notre base de données d\'évaluateurs pour la presse {$contextName}. Ceci ne vous oblige à rien, mais nous permet simplement de vous approcher si nous recevons une soumission que vous pourriez évaluer. Après avoir reçu une demande d\'évaluation, vous aurez la possibilité de lire le titre et le résumé de l\'article en question. Vous serez toujours libre d\'accepter ou de refuser l\'invitation. Vous pouvez demander que l\'on retire votre nom de notre liste d\'évaluateurs en tout temps.<br />
<br />
Voici votre nom d\'utilisateur et votre mot de passe, dont vous aurez besoin dans tous vos échanges avec la presse à travers son site Web. Vous pourriez, par exemple, mettre votre profil à jour, y compris vos champs d\'intérêt en ce qui concerne l\'évaluation des articles.<br />
<br />
<br />
Nom d\'utilisateur: {$username}<br />
Mot de passe: {$password}<br />
<br />
Merci,<br />
{$principalContactSignature}',
  'emails.reviewerRegister.description' => 'Ce courriel est envoyé à un nouvel évaluateur pour lui souhaiter la bienvenue dans le système et lui fournir une confirmation écrite de son nom d\'utilisateur et de son mot de passe.',
  'emails.publishNotify.subject' => 'Nouveau livre publié',
  'emails.publishNotify.body' => 'Chers lecteurs,<br />
<br />
{$contextName} a récemment publié son dernier livre au {$contextUrl}. Nous vous invitons à consulter la table des matières ici et à consulter notre site Web afin de lire les monographies et les articles qui vous intéressent.<br />
<br />
Merci de l\'intérêt que vous portez à nos publications.<br />
<br />
{$editorialContactSignature}',
  'emails.publishNotify.description' => 'Ce courriel est envoyé aux lecteurs par le lien d\'avis aux utilisateurs qui se trouve sur la page du rédacteur en chef. Il indique aux lecteurs que l\'on a récemment publié un nouveau livre et les invite à cliquer sur le lien URL de la presse.',
  'emails.submissionAck.subject' => 'Accusé de réception d\'une soumission',
  'emails.submissionAck.body' => '{$authorName}:<br />
<br />
Merci d\'avoir envoyé votre manuscrit &quot;{$submissionTitle}&quot; à la presse {$contextName}. Le système de gestion virtuel de la presse que nous utilisons vous permet de suivre les progrès de votre article tout au long du processus de publication. Il suffit d\'ouvrir une session sur le site Web:<br />
<br />
URL du manuscrit: {$submissionUrl}<br />
Nom d\'utilisateur: {$authorUsername}<br />
<br />
Si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />
<br />
{$editorialContactSignature}',
  'emails.submissionAck.description' => 'Lorsqu\'il est activé, ce courriel est envoyé automatiquement à l\'auteur lorsqu\'il soumet son manuscrit à la presse. Il fournit des renseignements sur le suivi de la soumission tout au long du processus de publication et remercie l\'auteur d\'avoir envoyé une soumission.',
  'emails.submissionAckNotUser.subject' => 'Accusé de réception d\'une soumission',
  'emails.submissionAckNotUser.body' => 'Bonjour,<br />
<br />
{$submitterName} a envoyé un manuscrit intitulé &quot;{$submissionTitle}&quot; à la presse {$contextName}. <br />
<br />
Si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir envoyé votre article à cette presse.<br />
<br />
{$editorialContactSignature}',
  'emails.submissionAckNotUser.description' => 'Lorsqu\'il est activé, ce courriel est envoyé automatiquement aux autres auteurs qui ne font pas partie des utilisateurs d\'OMP identifiés pendant le processus de soumission.',
  'emails.editorAssign.subject' => 'Travail éditorial',
  'emails.editorAssign.body' => '{$editorialContactName}:<br />
<br />
La soumission &quot;{$submissionTitle}&quot; à la presse {$contextName} vous a été assignée. En tant que rédacteur en chef, vous devrez superviser le processus éditorial de cette soumission.<br />
<br />
URL de la soumission: {$submissionUrl}<br />
Nom d\'utilisateur: {$editorUsername}<br />
<br />
Merci,',
  'emails.editorAssign.description' => 'Ce courriel indique au rédacteur en chef d\'une série qu\'on lui a assigné la tâche de superviser une soumission tout au long de son processus éditorial. Il contient des renseignements sur la soumission et indique comment accéder au site de la presse.',
  'emails.reviewRequest.subject' => 'Requête d\'évaluation d\'un manuscrit',
  'emails.reviewRequest.body' => 'Bonjour {$reviewerName},<br />
<br />
{$messageToReviewer}<br />
<br />
Veuillez ouvrir une session sur le site Web de la presse d\'ici le {$responseDueDate} pour indiquer si vous serez en mesure d\'évaluer l\'article ou non. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />
<br />
<br />
L\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />
<br />
URL de la soumission: {$submissionReviewUrl}<br />
<br />
Nom d\'utilisateur: {$reviewerUserName}<br />
<br />
Merci de votre intérêt à évaluer des articles pour notre presse.<br />
<br />
{$editorialContactSignature}<br />
',
  'emails.reviewRequest.description' => 'Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse. (Sinon, voir REVIEW_REQUEST_ATTACHED.)',
  'emails.reviewRequestOneclick.subject' => 'Requête d\'évaluation d\'un manuscrit',
  'emails.reviewRequestOneclick.body' => '{$reviewerName}:<br />
<br />
Je crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; soumis à la presse {$contextName}. Vous trouverez ci-dessous le résumé de l\'article. J\'espère que vous accepterez cette tâche importante du processus de publication.<br />
<br />
Veuillez ouvrir une session sur le site Web d\'ici le {$weekLaterDate} pour indiquer si vous acceptez ou refusez d\'évaluer l\'article. Ceci vous permettra également d\'accéder à la soumission, et de saisir votre évaluation et vos recommandations.<br />
<br />
L\'évaluation doit être terminée d\'ici le {$reviewDueDate}.<br />
<br />
URL de la soumission: {$submissionReviewUrl}<br />
<br />
Merci de votre intérêt à évaluer des articles pour notre presse.<br />
<br />
<br />
{$editorialContactSignature}<br />
<br />
<br />
<br />
&quot;{$submissionTitle}&quot;<br />
<br />
{$abstractTermIfEnabled}<br />
{$submissionAbstract}',
  'emails.reviewRequestOneclick.description' => 'Ce courriel est envoyé à un évaluateur par le rédacteur en chef d\'une série afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il fournit des informations sur la soumission comme le titre et le résumé de l\'article, il indique la date d\'échéance pour l\'évaluation et explique comment on peut accéder à la soumission. Ce message est utilisé lorsqu\'on choisit l\'option Processus d\'évaluation standard à l\'étape 2 de la section Configuration de la presse, et que l\'on a activé l\'option permettant à l\'évaluateur d\'avoir accès à la soumission en un seul clic.',
  'emails.reviewRequestAttached.subject' => 'Requête d\'évaluation d\'un manuscrit',
  'emails.reviewRequestAttached.body' => '{$reviewerName}:<br />
<br />
Je crois que vous seriez un excellent évaluateur pour le manuscrit &quot;{$submissionTitle}&quot; et nous vous serions reconnaissants si vous acceptiez cette tâche importante. Vous trouverez ci-dessous les lignes directrices de cette presse concernant l\'évaluation. Vous trouverez également la soumission en pièce jointe. Votre évaluation de la soumission et vos recommandations devraient nous parvenir par courriel d\'ici le {$reviewDueDate}.<br />
<br />
Veuillez répondre à ce courriel d\'ici le {$weekLaterDate} pour confirmer si vous acceptez d\'évaluer cet article.<br />
<br />
<br />
Nous vous remercions à l\'avance et espérons que vous accepterez cette requête.<br />
<br />
{$editorialContactSignature}<br />
<br />
<br />
Lignes directrices concernant l\'évaluation<br />
<br />
{$reviewGuidelines}<br />
',
  'emails.reviewRequestAttached.description' => 'Ce courriel est envoyé par le rédacteur en chef d\'une série à un évaluateur afin de lui demander s\'il accepte ou refuse d\'évaluer une soumission. Il contient la soumission en pièce jointe. Ce message est utilisé lorsque vous sélectionnez l\'option Processus d\'évaluation par courriel avec pièce jointe à l\'étape 2 de la Configuration de la presse. (Sinon, voir REVIEW_REQUEST.)',
  'emails.reviewCancel.subject' => 'Annulation de la requête d\'évaluation',
  'emails.reviewCancel.body' => '{$reviewerName}:<br />
<br />
<br />
Nous avons décidé d\'annuler notre requête d\'évaluation pour la soumission &quot;{$submissionTitle}&quot; de la presse {$contextName}. Nous vous prions de nous excuser pour tout inconvénient que cette décision pourrait occasionner et nous espérons que vous serez en mesure d\'évaluer une soumission dans un avenir prochain.<br />
<br />
Si vous avez des questions, n\'hésitez pas à me contacter.',
  'emails.reviewCancel.description' => 'Ce courriel est envoyé à un évaluateur qui a entamé le processus d\'évaluation d\'une soumission par le rédacteur en chef d\'une série afin d\'informer l\'évaluateur que la procédure d\'évaluation a été annulée.',
  'emails.reviewConfirm.subject' => 'En mesure d\'évaluer',
  'emails.reviewConfirm.body' => 'Éditeurs:<br />
<br />
Je peux et je souhaite évaluer la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m\'avoir invité à évaluer cet article. Je prévois terminer mon évaluation d\'ici le {$reviewDueDate}.<br />
<br />
{$reviewerName}',
  'emails.reviewConfirm.description' => 'Ce courriel est envoyé au rédacteur en chef d\'une série pour répondre à la requête d\'évaluation. Il a pour but de permettre à l\'évaluateur d\'indiquer au rédacteur en chef qu\'il a accepté d\'évaluer l\'article et qu\'il aura terminé son évaluation dans les délais prescrits.',
  'emails.reviewDecline.subject' => 'Ne peux pas évaluer',
  'emails.reviewDecline.body' => 'Éditeurs:<br />
<br />
Malheureusement, je ne pourrai pas évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Merci de m\'avoir invité à évaluer cet article et n\'hésitez pas à me contacter dans un avenir prochain.<br />
<br />
{$reviewerName}',
  'emails.reviewDecline.description' => 'Ce courriel est envoyé par l\'évaluateur au rédacteur en chef d\'une série série pour indiquer qu\'il ne sera pas en mesure d\'évaluer l\'article en question.',
  'emails.reviewAck.subject' => 'Accusé de réception pour l\'évaluation d\'un manuscrit',
  'emails.reviewAck.body' => '{$reviewerName}:<br />
<br />
<br />
Merci d\'avoir terminé l\'évaluation de l\'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Grâce à vous, nous sommes en mesure de publier des articles de qualité.',
  'emails.reviewAck.description' => 'Ce courriel est envoyé par le rédacteur en chef d\'une série pour confirmer qu\'il a reçu l\'évaluation finale de l\'article et pour le remercier de sa contribution.',
  'emails.reviewRemind.subject' => 'Rappel d\'évaluation',
  'emails.reviewRemind.body' => '{$reviewerName}:<br />
<br />
Nous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />
<br />
Si vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />
<br />
URL de la soumission: {$submissionReviewUrl}<br />
<br />
Nom d\'utilisateur: {$reviewerUserName}<br />
<br />
Nous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />
<br />
{$editorialContactSignature}',
  'emails.reviewRemind.description' => 'Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.',
  'emails.reviewRemindOneclick.subject' => 'Rappel d\'évaluation',
  'emails.reviewRemindOneclick.body' => '{$reviewerName}:<br />
<br />
Nous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais<br />
<br />
URL de la soumission: {$submissionReviewUrl}<br />
<br />
Nous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Nous vous prions d\'agréer l\'expression de nos sentiments les plus distingués. <br />
<br />
{$editorialContactSignature}',
  'emails.reviewRemindOneclick.description' => 'Ce courriel est envoyé par le rédacteur en chef d\'une série pour rappeler à l\'évaluateur qu\'il doit envoyer sa soumission dès que possible.',
  'emails.reviewRemindAuto.subject' => 'Rappel automatique d\'évaluation d\'une soumission',
  'emails.reviewRemindAuto.body' => '{$reviewerName}:<br />
<br />
Nous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />
<br />
Si vous n\'avez plus votre nom d\'utilisateur et mot de passe pour le site Web, vous pouvez réinitialiser votre mot de passe en cliquant sur le lien suivant. Votre mot de passe et nom d\'utilisateur vous seront envoyés par courriel. {$passwordResetUrl}<br />
<br />
URL de la soumission: {$submissionReviewUrl}<br />
<br />
Nous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />
<br />
{$editorialContactSignature}',
  'emails.reviewRemindAuto.description' => 'Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est désactivé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).',
  'emails.reviewRemindAutoOneclick.subject' => 'Rappel automatique d\'évaluation d\'une soumission',
  'emails.reviewRemindAutoOneclick.body' => '{$reviewerName}:<br />
<br />
Nous vous remercions d\'avoir accepté d\'évaluer &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez noter que cette évaluation doit nous parvenir avant le {$reviewDueDate}. Ce courriel a été généré et envoyé automatiquement parce que vous avez dépassé la date d\'échéance. Toutefois, nous vous serions reconnaissants si vous pouviez nous faire parvenir votre évaluation dans les plus brefs délais.<br />
<br />
URL de la soumission: {$submissionReviewUrl}<br />
<br />
Nous vous prions de confirmer si vous êtes encore disponible pour participer à cette étape cruciale de notre processus éditorial. Veuillez agréer l\'expression de nos sentiments les plus distingués. <br />
<br />
{$editorialContactSignature}',
  'emails.reviewRemindAutoOneclick.description' => 'Ce courriel est envoyé automatiquement lorsqu\'une évaluation est en retard (voir les options d\'évaluation à l\'étape 2 de la section Configuration de la presse) et que l\'accès de l\'évaluateur en un seul clic est activé. Les tâches prévues doivent être activées et configurée (voir le fichier de configuration du site).',
  'emails.editorDecisionAccept.subject' => 'Décision du rédacteur en chef',
  'emails.editorDecisionAccept.body' => '{$authorName}:<br />
<br />
Nous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />
<br />
Nous avons décidé de:<br />
<br />
URL du manuscrit: {$submissionUrl}',
  'emails.editorDecisionAccept.description' => 'Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.',
  'emails.editorDecisionSendToExternal.subject' => 'Décision du rédacteur en chef',
  'emails.editorDecisionSendToExternal.body' => '{$authorName}:<br />
<br />
Nous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />
<br />
Nous avons décidé de:<br />
<br />
URL du manuscrit: {$submissionUrl}',
  'emails.editorDecisionSendToExternal.description' => 'Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission sera envoyée à un évaluateur externe.',
  'emails.editorDecisionSendToProduction.subject' => 'Décision du rédacteur en chef',
  'emails.editorDecisionSendToProduction.body' => '{$authorName}:<br />
<br />
La révision de votre manuscrit &quot;{$submissionTitle}&quot; est terminée. Nous l\'envoyons maintenant en production.<br />
<br />
URL du manuscrit: {$submissionUrl}',
  'emails.editorDecisionSendToProduction.description' => 'Ce courriel est envoyé par un rédacteur en chef à un auteur pour l\'informer que sa soumission passera à l\'étape de production.',
  'emails.editorDecisionRevisions.subject' => 'Décision du rédacteur en chef',
  'emails.editorDecisionRevisions.body' => '{$authorName}:<br />
<br />
Nous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />
<br />
Nous avons décidé de:<br />
<br />
URL du manuscrit: {$submissionUrl}',
  'emails.editorDecisionRevisions.description' => 'Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.',
  'emails.editorDecisionResubmit.subject' => 'Décision du rédacteur en chef',
  'emails.editorDecisionResubmit.body' => '{$authorName}:<br />
<br />
Nous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />
<br />
Nous avons décidé de:<br />
<br />
URL du manuscrit: {$submissionUrl}',
  'emails.editorDecisionResubmit.description' => 'Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.',
  'emails.editorDecisionDecline.subject' => 'Décision du rédacteur en chef',
  'emails.editorDecisionDecline.body' => '{$authorName}:<br />
<br />
Nous avons pris une décision concernant votre soumission à la presse {$contextName} intitulée &quot;{$submissionTitle}&quot;.<br />
<br />
Nous avons décidé de:<br />
<br />
URL du manuscrit: {$submissionUrl}',
  'emails.editorDecisionDecline.description' => 'Ce courriel est envoyé par un rédacteur en chef à un auteur pour signaler que l\'on a pris une décision finale concernant sa soumission.',
  'emails.copyeditRequest.subject' => 'Requête de révision',
  'emails.copyeditRequest.body' => '{$participantName}:<br />
<br />
J\'aimerais que vous entamiez le processus de révision de l\'article &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Veuillez suivre les étapes suivantes.<br />
<br />
1. Cliquez sure le lien URL de la soumission ci-dessous.<br />
2. Ouvrez une session sur la presse et cliquez sur le fichier qui apparait à l\'étape 1.<br />
3. Lisez les instructions de révision publiées sur la page Web.<br />
4. Ouvrez le fichier téléchargé et débutez le processus de révision, tout en ajoutant des questions pour les auteurs, au besoin.<br />
5. Sauvegardez le fichier révisé et téléchargez-le à l\'étape 1 de Révision.<br />
6. Envoyez le courriel COMPLET au rédacteur en chef.<br />
<br />
{$contextName} URL: {$contextUrl}<br />
URL de la soumission: {$submissionUrl}<br />
Nom d\'utilisateur: {$participantUsername}',
  'emails.copyeditRequest.description' => 'Ce courriel est envoyé par le rédacteur en chef d\'une série au réviseur de la soumission afin qu\'il entame de processus de révision, lorsque l\'évaluation par les pairs est terminée. Il explique comment accéder à la soumission.',
  'emails.layoutRequest.subject' => 'Requête des épreuves en placard',
  'emails.layoutRequest.body' => '{$participantName}:<br />
<br />
Il faut maintenant préparer les épreuves en placard de la soumission &quot;{$submissionTitle}&quot; pour la presse {$contextName}. Pour ce faire, veuillez suivre les étapes suivantes:<br />
<br />
1. Cliquez sur le lien URL de la soumission ci-dessous.<br />
2. Ouvrez une session sur la presse et utilisez le fichier Version de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />
3. Envoyez le courriel COMPLET au rédacteur en chef.<br />
<br />
{$contextName} URL: {$contextUrl}<br />
URL de la soumission: {$submissionUrl}<br />
Nom d\'utilisateur: {$participantUsername}<br />
<br />
Si vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.',
  'emails.layoutRequest.description' => 'Ce courriel est envoyé au rédacteur metteur en page par le rédacteur en chef de la série pour lui indiquer qu\'on lui a demandé de faire la mise en page de la soumission. Il contient des renseignements sur la soumission et explique comment y accéder.',
  'emails.layoutComplete.subject' => 'Épreuves en placard complétées',
  'emails.layoutComplete.body' => '{$editorialContactName}:<br />
<br />
Les épreuves en placard du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} ont été préparées et peuvent être révisées.<br />
<br />
Si vous avez questions, n\'hésitez pas à me contacter.<br />
<br />
{$signatureFullName}',
  'emails.layoutComplete.description' => 'Ce courriel est envoyé par le rédacteur metteur en page au rédacteur d\'une série pour l\'informer que la mise en page du manuscrit est terminée.',
  'emails.indexRequest.subject' => 'Requête d\'indexage',
  'emails.indexRequest.body' => '{$participantName}:<br />
<br />
La soumission &quot;{$submissionTitle}&quot; par la presse {$contextName} doit désormais être indexée. Veuillez suivre les étapes suivantes:<br />
<br />
1. Cliquez sur le lien URL de la soumission ci-dessous.<br />
2. Ouvrez une session sur la presse et utilisez les fichiers d\'épreuves de mise en page pour créer les épreuves en placard conformément aux normes de la presse.<br />
3. Envoyez le courriel COMPLET au rédacteur en chef.<br />
<br />
{$contextName} URL: {$contextUrl}<br />
URL de la soumission: {$submissionUrl}<br />
Nom d\'utilisateur: {$participantUsername}<br />
<br />
Si vous ne pouvez pas faire ce travail en ce moment ou si vous avez des questions, n\'hésitez pas à me contacter. Merci d\'avoir contribué à cette presse.<br />
<br />
{$editorialContactSignature}',
  'emails.indexRequest.description' => 'Ce courriel est envoyé à l\'indexateur par le rédacteur en chef d\'une série pour lui indiquer qu\'il devra créer les index de la soumission en question. Il contient des renseignements sur la soumission et explique comment y accéder.',
  'emails.indexComplete.subject' => 'Indexage des épreuves en placard complété',
  'emails.indexComplete.body' => '{$editorialContactName}:<br />
<br />
Les index du manuscrit &quot;{$submissionTitle}&quot; pour la presse {$contextName} sont prêts et peuvent être révisés.<br />
<br />
Si vous avez questions, n\'hésitez pas à me contacter.<br />
<br />
{$signatureFullName}',
  'emails.indexComplete.description' => 'Ce courriel est envoyé par l\'indexateur au rédacteur en chef d\'une série pour lui indiquer que l\'indexage est terminé.',
  'emails.emailLink.subject' => 'Manuscrit susceptible d\'intéresser',
  'emails.emailLink.body' => 'Nous crayons que l\'article intitulé &quot;{$submissionTitle}&quot; par {$authorName} publié dans le Volume {$volume}, No {$number} ({$year}) de la presse {$contextName} au &quot;{$monographUrl}&quot; pourrait vous intéresser.',
  'emails.emailLink.description' => 'Ce modèle de courriel permet à un lecteur inscrit d\'envoyer des renseignements sur une monographie à une personne qui pourrait être intéressée. Il est disponible dans les Outils de lecture et peut être activé par le gestionnaire de la presse sur la page Administration des outils de lecture.',
  'emails.notifySubmission.subject' => 'Avis de soumission',
  'emails.notifySubmission.body' => 'Vous avez reçu un message de {$sender} concernant la monographie &quot;{$submissionTitle}&quot; ({$monographDetailsUrl}):<br />
<br />
		{$message}<br />
<br />
		',
  'emails.notifySubmission.description' => 'Avis envoyé par un usager à partir d\'un centre de renseignements sur les soumissions.',
  'emails.notifyFile.subject' => 'Avis de soumission d\'un fichier',
  'emails.notifyFile.body' => 'Vous avez un message de {$sender} concernant le fichier &quot;{$fileName}&quot; dans &quot;{$submissionTitle}&quot; ({$monographDetailsUrl}):<br />
<br />
		{$message}<br />
<br />
		',
  'emails.notifyFile.description' => 'Avis envoyé par un usager à partir d\'un centre de renseignements sur les fichiers.',
  'emails.notificationCenterDefault.subject' => 'Un message à propos de la presse {$contextName}',
  'emails.notificationCenterDefault.body' => 'Veuillez saisir votre message.',
  'emails.notificationCenterDefault.description' => 'Le message (vierge) par défaut utilisé par le centre d\'alerte.',
);