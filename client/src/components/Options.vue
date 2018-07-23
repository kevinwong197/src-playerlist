<template>
  <div class="p-0 my-0 input-group">
    <game-select />
    <toggles />
    <map-select />
  </div>
</template>

<script>
import GameSelect from '@/components/options/GameSelect'
import MapSelect from '@/components/options/MapSelect'
import Toggles from '@/components/options/Toggles'

export default {
  components: {
    GameSelect,
    MapSelect,
    Toggles
  }
}
</script>
