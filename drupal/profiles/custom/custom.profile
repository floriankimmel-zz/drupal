<?php

function drupaltestbot_profile_details() {
  return array(
    'name' => 'custom',
    'description' => 'Automating deployments'
  );
}

function drupaltestbot_profile_modules() {
  return array('backup_migrate',);
}
