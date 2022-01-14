export default[
    {
      path: '/',
      component: () => import('@/views/Main'), // main
      children: [    
        {
        path:'/home',
        name:'home',
        component: () => import('@/views/home')
        },
      ]
    },
    
]