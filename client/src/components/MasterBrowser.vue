<template>
  <div>
    <options-modal />
    <navbar />
    <div class="container">
      <div class="row">
        <servers />
  <!--       <simple-bar class="servers col-md-8">
          
        </simple-bar>
        <simple-bar class="players col-md-4">
          <players />
        </simple-bar> -->
      </div>
    </div>
  </div>
</template>

<script>
import RefreshButton from '@/components/RefreshButton'
import Servers from '@/components/Servers'
import Players from '@/components/Players'
import SimpleBar from '@/components/SimpleBar'
import Navbar from '@/components/Navbar'
import OptionsModal from '@/components/navbar/OptionsModal'


export default {
  components: {
    RefreshButton,
    Servers,
    Players,
    SimpleBar,
    Navbar,
    OptionsModal
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
