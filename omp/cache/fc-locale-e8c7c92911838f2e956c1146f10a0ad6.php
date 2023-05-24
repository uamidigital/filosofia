<?php return array (
  'emails.paypalInvestigatePayment.body' => 'Open Monograph Press ha detectado una actividad inusual relacionada con el soporte de pago por PayPal de la editorial {$contextName}. Esta actividad podría requerir una investigación más detallada o una intervención manual.<br />
                       <br />
Este correo electrónico ha sido generado por el módulo de PayPal de Open Monograph Press.<br />
<br />
Información completa de envío para la solicitud:<br />
{$postInfo}<br />
<br />
 Información adicional (si se proporciona):<br />
{$additionalInfo}<br />
<br />
Variables de servidor:<br />
{$serverVars}<br />
',
  'emails.paypalInvestigatePayment.description' => 'Esta plantilla de correo electrónico se utiliza para notificar al contacto principal de la editorial que el módulo de Paypal ha detectado una actividad sospechosa o que requiere una intervención manual.',
  'emails.paypalInvestigatePayment.subject' => 'Actividad inusual en PayPal',
);