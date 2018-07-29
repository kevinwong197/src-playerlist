<template>
  <b-navbar-brand @click="search" class="btn btn-dark">
    <span class="d-none d-md-inline-block">MasterBrowser:</span>
    <span>{{name}}</span>
  </b-navbar-brand>
</template>

<script>
import eventBus from '@/services/eventBus'

export default {
  data () {
    return {
      name: ':v'
    }
  },
  mounted () {
    eventBus.$on('updategamelabel', (name) => {
      this.name = name
    })
  },
  methods: {
    search () {
      eventBus.$emit('getservers')
    }
  }
}
</script>

<style scoped>
.nohighlight {
  -moz-user-select: none;
  -webkit-user-select: none;
  -ms-user-select: none;
  -o-user-select: none;
  user-select: none;    
}
</style>