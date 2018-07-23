<template>
  <b-input-group class="px-0">
    <game-select slot="prepend"/>
    <map-input />
    <config slot="append"/>
    <config-modal />
  </b-input-group>
</template>

<script>
import GameSelect from '@/components/options/GameSelect'
import MapInput from '@/components/options/MapInput'
import Config from '@/components/options/Config'
import ConfigModal from '@/components/options/config/ConfigModal'

export default {
  components: {
    GameSelect,
    MapInput,
    Config,
    ConfigModal
  }
}
</script>
