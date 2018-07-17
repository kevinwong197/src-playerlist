import Vue from 'vue'
import Router from 'vue-router'
import MasterBrowser from '@/components/MasterBrowser'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'MasterBrowser',
      component: MasterBrowser
    }
  ]
})
