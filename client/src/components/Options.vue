<template>
  <b-input-group class="px-0">
    <game-select slot="prepend"/>
    <map-select />
    <config slot="append"/>
    <config-modal />
  </b-input-group>
</template>

<script>
import GameSelect from '@/components/options/GameSelect'
import MapSelect from '@/components/options/MapSelect'
import Config from '@/components/options/Config'
import ConfigModal from '@/components/options/config/ConfigModal'

export default {
  components: {
    GameSelect,
    MapSelect,
    Config,
    ConfigModal
  }
}
</script>
