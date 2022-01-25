export default[
  {
    path: '/',
    name:'main',
    component: () => import('@/views/Main'), // main
    children: [    
      {
      path:'table',
      name:'table',
      component: () => import('@/views/table')
      },
      {
        path:'input',
        name:'input',
        component: () => import('@/views/input')
      },
    ]
  },
  {
    path:'/login',
    name:'login',
    component: () => import('@/views/login')
  },
  {
    path:'/regist',
    name:'regist',
    component: () => import('@/views/regist')
  },
]