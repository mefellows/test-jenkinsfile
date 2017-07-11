#!/usr/bin/env groovy

/*
 * Project multibranch pipeline job
 */

jobDsl scriptText:
"""
multibranchPipelineJob("projects/${env.project}") {

  branchSources {
    git {
      remote("https://github.com/mefellows/${env.project}.git")
      //credentialsId('mfellows')
      includes('*')
    }
  }

  triggers {
    periodic(1)
  }

  orphanedItemStrategy {
    discardOldItems {
      numToKeep(0)
    }
  }

}
"""
