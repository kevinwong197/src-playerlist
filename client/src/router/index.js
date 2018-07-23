import Vue from 'vue'
import Router from 'vue-router'
import MasterBrowser from '@/components/MasterBrowser'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/:gamedir/:name',
      component: MasterBrowser
    },
    {
      path: '/',
      component: MasterBrowser
    },
    {
      path: '/:gamedir',
      component: MasterBrowser
    }
  ]
})
