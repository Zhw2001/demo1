<template>
<div >
    <el-form :inline="true">
        <el-form-item label="课程编号:">
            <el-select :value="formData.cid" placeholder="CID"  @change = "handleCidChange">
                <el-option
                v-for="item in formData.cidList"
                :key = "item.value"
                :label = "item.label"
                :value = "item.value">
                </el-option>
            </el-select>
        </el-form-item>
        <el-form-item label="学年:">
            <el-select :value="formData.stime" placeholder="STIME"  @change = "handleSTimeChange">
                <el-option
                v-for="item in formData.stimeList"
                :key = "item.value"
                :label = "item.label"
                :value = "item.value">
                </el-option>
            </el-select>
        </el-form-item>
    </el-form>
    <el-table    
        size='mini'
        :header-cell-style = "mytable"
        :cell-style = "mytableCell"
        :data="currentPageData"
        @select="Select"
        @select-all = "SelectAll">
        <el-table-column
        type="selection">
        </el-table-column>

        <el-table-column v-if='false'>
            <template slot-scope="scope">
                <span>{{scope.row.id}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学号">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sid" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sid}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学生姓名">  
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sname" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sname}}</span>
            </template>
        </el-table-column>    

        <el-table-column
        label="学生专业">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sclass" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sclass}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="学生状态">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.sstate" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.sstate}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="平时成绩">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.regular" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.regular}}</span>
            </template>
        </el-table-column>
            
        <el-table-column
        label="卷面成绩">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.written" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.written}}</span>
            </template>
        </el-table-column>

        <el-table-column
        label="总成绩">
            <template slot-scope="scope">
                <el-input size="small"  v-if="scope.row.selected" v-model="scope.row.overall" placeholder="学年"></el-input> <span v-if="!scope.row.selected">{{scope.row.overall}}</span>
            </template>
        </el-table-column>

        <el-table-column v-if="false" label="操作">
        <template slot-scope="scope" >
            <span class="my_button" v-if="!scope.row.selected" @click="edit(scope.row)">
                修改
            </span>
            <span class="my_button" v-else  @click="RowSave(scope.row)">
                保存
            </span>
            <span class="my_button" v-if="!scope.row.selected" @click="RowDel(scope.row)">
                删除
            </span>
            <span class="my_button" v-else  @click="cancel(scope.row)">
                取消
            </span>
        </template>
        </el-table-column>
    </el-table>
    <div style="margin: 10px 0">
        <el-pagination
        class="pagination"
        @size-change="SizeChange"
        @current-change="CurrentPageChange"
        :current-page="currentPage"
        :page-sizes="[5, 10, 15, 20]"
        :page-size="10"
        layout="total, sizes, prev, pager, next, jumper"
        :total="totalRecord">
        </el-pagination>
    </div>
</div>
</template>

<script>

export default{
    name:"course",

    props:{
        dataList : Object,
        w_lock : Boolean,
    },

    data(){
        return{
            wlock: true,
            rowCache: {},
            totalRecord:1, // 总共记录数
            totalPage: 1, // 总共页数，默认为1
            currentPage: 1, //当前页数 ，默认为1
            pageSize: 10, // 每页显示数量
            currentPageData: [], //当前页显示内容
            formData: {
                cid: '', //1 确定了课程，显示所有学年的记录
                stime: '',//2 确定学年，显示当前选中学年记录
                data: [],
                stimeList: [], 
                cidList:[],
            }
        }
    },
    methods:{

        mytable(){
            return this.$setCss.tableHeadCell
        },
        mytableCell(){
            return this.$setCss.tableCell
        },

        SetRow(row){
            row.id = this.rowCache.id;
            row.regular = this.rowCache.regular;
            row.written = this.rowCache.written;
            row.overall = this.rowCache.overall;
            row.stime = this.rowCache.stime;
            row.sid = this.rowCache.sid;
            row.cid = this.rowCache.cid;
            row.sclass = this.rowCache.sclass;
            row.sstate = this.rowCache.sstate;
            row.sname = this.rowCache.sname;
            row.cnum = this.rowCache.cnum;
            row.selected= this.rowCache.selected;
        },


        //批量处理
        Select(value) {
            console.log(value);
        },
        SelectAll(value){
            console.log(value);
        },

        //增删改
        RowSave(row){
            this.wlock = true;
            this.$request.post("/api_S/course/update",row).then(res =>{
                if(res.code != '111'){
                    this.$message("保存成功");
                }
                else{
                    this.$message("Failed")
                }
            });
            row.selected = false;
        },
        edit(row){
            this.rowCache = JSON.parse(JSON.stringify(row));
            console.log(123,this.rowCache);
            if(!this.wlock){
                this.$message.warning("请先保存当前编辑项");
                return;
            }
            row.selected = true;
            this.wlock = false;
        },
        cancel(row){
            var type = 0;
            console.log(type);
            this.wlock = true;
            if(this.rowCache != null){this.SetRow(row);}
            this.$emit("delEmptyRow",type);
        },
        RowDel(index,row){
            if(!this.wlock){
                this.$message.warning("请先保存当前编辑项");
                return;
            }
            this.$request.post("/api_S/course/delete",row).then(res =>{
                if(res.code != '111'){
                    this.$message("删除成功");
                    this.this.formData.data.splice(index,1);
                    this.load();
                }
                else{
                    this.$message("Failed")
                }
            });
        },

        //前端分页
        setCurrentPageData(data) {
            this.totalRecord = data.length
            this.totalPage = Math.ceil(data.length / this.pageSize)
            this.totalPage = this.totalPage == 0 ? 1 : this.totalPage
            let begin = (this.currentPage - 1) * this.pageSize;
            let end = this.currentPage * this.pageSize;
            this.currentPageData = data.slice(begin,end);
        },
        SizeChange(v){
            this.pageSize = v;
            this.setCurrentPageData();
        },
        CurrentPageChange(v){
            this.currentPage = v;
            this.setCurrentPageData();
        },

        loadCids(){
            this.formData.cidList = []
            for( let i of this.dataList.course_list ){
                let temp = {}
                temp.label = i.cname
                temp.value = i.cid
                this.formData.cidList.push(temp)
            }
        },

        loadData(cid){//确定cid才能确定数据
            for( let i = 0; i < this.dataList.course_list.length; i++ ){
                if(this.dataList.course_list[i].cid == cid){
                    this.formData.data = this.dataList.course_list[i].courseData
                    break
                }
            }
            this.setCurrentPageData(this.formData.data)
            this.loadSTime()
        },

        loadSTime(){//确定数据才能确定stime
            this.formData.stimeList=[]
            let value =[]
            for( let i = 0; i < this.formData.data.length; i++){
                if(value.indexOf(this.formData.data[i].stime) == -1){
                    value.push(this.formData.data[i].stime)
                }
            }
            for(let i of value){
                let temp = {}
                temp.label = i
                temp.value = i
                this.formData.stimeList.push(temp)
            }
            console.log('TIMELIST',this.formData.stimeList)
        },

        handleCidChange(v){
            this.formData.cid = v
            this.loadData(v)
        },

        handleSTimeChange(v){
            this.formData.stime = v
            let temp = []
            for(let i of this.formData.data){
                if(i.stime == v){
                    temp.push(i)
                } 
            }
            this.setCurrentPageData(temp)
        }

    },

    created(){
        this.loadCids();
    },

    watch:{
        'dataList.CourseData' : function(){
            this.loadCids();
        },
        w_lock : function(){
            this.wlock = this.w_lock;
            this.CurrentPageChange(this.totalPage);
            this.rowCache = null;
        },
    }
}
</script>

<style scoped>
.my_button{
    padding:2px;   
}
.my_button:hover{
    color:red;
}

</style>