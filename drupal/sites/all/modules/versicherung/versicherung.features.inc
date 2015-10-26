<?php
/**
 * @file
 * versicherung.features.inc
 */

/**
 * Implements hook_ctools_plugin_api().
 */
function versicherung_ctools_plugin_api($module = NULL, $api = NULL) {
  if ($module == "strongarm" && $api == "strongarm") {
    return array("version" => "1");
  }
}
