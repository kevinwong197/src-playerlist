<template>
  <div class="container mb-2">
    <div class="row">
      <refresh-button class="col" />
    </div>
    <div class="row">
      <options class="col" />
    </div>
    <div class="lists row">
      <simple-bar class="servers col-md-8">
        <servers />
      </simple-bar>
      <simple-bar class="players col-md-4">
        <players />
      </simple-bar>
    </div>
  </div>
</template>

<script>
import RefreshButton from '@/components/RefreshButton'
import Options from '@/components/Options'
import Servers from '@/components/Servers'
import Players from '@/components/Players'
import SimpleBar from '@/components/SimpleBar'

export default {
  components: {
    RefreshButton,
    Options,
    Servers,
    Players,
    SimpleBar
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
