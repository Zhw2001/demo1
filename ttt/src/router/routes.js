export default[
  {
    path: '/',
    name:'main',
    component: () => import('@/views/Main'), // main
    children: [    
      {
      path:'user',
      name:'user',
      component: () => import('@/views/user/view/user')
      },
      {
        path:'userRoleMenu',
        name:'userRoleMenu',
        component: () => import('@/views/user/view/userRoleMenu')
      },
      {
        path:'add',
        name:'AddData',
        component: () => import('@/views/input/view/AddData')
      },
      {
        path:'cd',
        name:'CourseDegree',
        component: () => import('@/views/input/view/CourseDegree')
      },
      {
        path:'ea',
        name:'ExamAudit',
        component: () => import('@/views/input/view/ExamAudit')
      },
      {
        path:'course',
        name:'course',
        component: () => import('@/views/course')
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