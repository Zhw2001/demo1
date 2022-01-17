export default[
    {
      path: '/',
      component: () => import('@/views/Main'), // main
      children: [    
        {
        path:'/table',
        name:'table',
        component: () => import('@/views/table')
        },
        {
        path:'/generate',
        name:'generate',
        component: () => import('@/views/generate')
        },
      ]
    },
    
]