<template>
  <div class="container mb-2">
    <div class="row">
      <refresh-button class="col" />
    </div>
    <div class="row">
      <master-options class="col" />
    </div>
    <div class="lists row">
      <servers class="servers col-md-8" />
      <players class="players col-md-4 fix" />
    </div>
  </div>
</template>

<script>
import RefreshButton from '@/components/RefreshButton'
import MasterOptions from '@/components/Options'
import Servers from '@/components/Servers'
import Players from '@/components/Players'

export default {
  components: {
    RefreshButton,
    MasterOptions,
    Servers,
    Players
  }
}
</script>

<style scoped>
@media (min-width: 768px) {
  .servers, .players {
    height: 80vh;
    overflow-y: scroll;
  }
}
</style>
