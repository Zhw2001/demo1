<template>
    <div class="home-container">
        <div class="card">
            <div class="card-body">
                <el-tree :data="mydata" :props="defaultProps" :expand-on-click-node="false">
                    <span class="custom-tree-node" slot-scope="{ node, data }">
                        <span>{{ node.label }}</span>
                        <span v-if='false'>
                        <el-button
                            type="text"
                            @click="() => append(data)">
                            <i class="el-icon-circle-plus-outline"></i>
                        </el-button>
                        <el-button
                            type="text"
                            @click="() => remove(node, data)">
                            <i class="el-icon-remove-outline"></i>
                        </el-button>
                        </span>
                    </span>
                </el-tree>
            </div>
        </div>
    </div>
</template>

<script>

 let id = 1000;
  export default {
    data() {
        return {
            mydata: [],
            defaultProps: {
                id:'id',
                children: 'children',
                label: 'label'
            },
        };
    },
    methods: {
      append(data) {
        const newChild = { id: id++, label: 'testtest', children: [] };
        if (!data.children) {
          this.$set(data, 'children', []);
        }
        data.children.push(newChild);
      },

      remove(node, data) {
        const parent = node.parent;
        const children = parent.data.children || parent.data;
        const index = children.findIndex(d => d.id === data.id);
        children.splice(index, 1);
      },
      load(){
        this.$request.get("/api_S/auth/list").then(res=>{
            var data = res.data;
            for(let i of data){
                this.cook(i);
            }
        })
      },
      hasParent(data){
        if(data.authority_parent_id == '' || data.authority_parent_id == null){
            return false;
        }
        return true;
      },
      cook(data){
        if(this.hasParent(data)){
            let parent = this.mydata.find(function(x){return x.label == data.authority_parent_name});
            parent.children.push({id:data.authority_id,label:data.authority_name,children:[]});
        }
        else{
           this.mydata.push({id:data.authority_id,label:data.authority_name,children:[]});
        }
      }
    },
    created(){
      this.load();
    },
  };
</script>

<style>
  .custom-tree-node {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
  }
</style>