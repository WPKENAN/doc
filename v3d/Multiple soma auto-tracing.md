# Multiple soma auto-tracing

## Consensus
### step1、trace independently based on different soma
### step2、merge tracing results of step1;
### step3、re-trace the repetitive part OR split the repetitive part

## Hyperplane
### step1、find  one(more) hyperplane(s) in a block
### step2、split block to different areas(somas)
### step3、trace independently based on different areas after hyperplane segmentation

## Confrontation
### step1、Parallel tracing

## Strong->Weak
### step1、Track where the gray value is high(all somas at the same time)
### step2、Track where the gray value is lower
### step3、redo step2

## Prior knowledge
### 信号从胞体出发越来越弱，不是越来越强

## Multiple MST
### Prim
### Kruskal
### 1、生成一个全局的mst；2、切割step1生成的mst生成两个mst；3、迭代算法2直到生成所有mst
