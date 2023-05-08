<?php return array (
  'crontab' => 
  array (
    0 => 
    array (
      'className' => 'plugins.generic.usageStats.UsageStatsLoader',
      'frequency' => 
      array (
        'hour' => 24,
      ),
      'args' => 
      array (
        0 => 'autoStage',
      ),
    ),
    1 => 
    array (
      'className' => 'plugins.generic.usageStats.UsageStatsLoader',
      'frequency' => 
      array (
        'hour' => 24,
      ),
      'args' => 
      array (
        0 => 'autoStage',
      ),
    ),
    2 => 
    array (
      'className' => 'plugins.generic.usageStats.UsageStatsLoader',
      'frequency' => 
      array (
        'hour' => 24,
      ),
      'args' => 
      array (
        0 => 'autoStage',
      ),
    ),
    3 => 
    array (
      'className' => 'plugins.generic.usageStats.UsageStatsLoader',
      'frequency' => 
      array (
        'hour' => 24,
      ),
      'args' => 
      array (
        0 => 'autoStage',
      ),
    ),
    4 => 
    array (
      'className' => 'lib.pkp.classes.task.ReviewReminder',
      'frequency' => 
      array (
        'hour' => 24,
      ),
      'args' => 
      array (
      ),
    ),
    5 => 
    array (
      'className' => 'lib.pkp.classes.task.PublishSubmissions',
      'frequency' => 
      array (
        'hour' => 24,
      ),
      'args' => 
      array (
      ),
    ),
    6 => 
    array (
      'className' => 'lib.pkp.classes.task.StatisticsReport',
      'frequency' => 
      array (
        'day' => '1',
      ),
      'args' => 
      array (
      ),
    ),
  ),
  'enabled' => true,
);