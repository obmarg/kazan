defmodule K8s.Io.Api.Extensions.V1beta1.AllowedCSIDriver do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t()
        }
  defstruct [:name]

  field :name, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.AllowedFlexVolume do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          driver: String.t()
        }
  defstruct [:driver]

  field :driver, 1, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.AllowedHostPath do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          pathPrefix: String.t(),
          readOnly: boolean
        }
  defstruct [:pathPrefix, :readOnly]

  field :pathPrefix, 1, optional: true, type: :string
  field :readOnly, 2, optional: true, type: :bool
end

defmodule K8s.Io.Api.Extensions.V1beta1.DaemonSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Extensions.V1beta1.DaemonSetSpec.t() | nil,
          status: K8s.Io.Api.Extensions.V1beta1.DaemonSetStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.DaemonSetSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Extensions.V1beta1.DaemonSetStatus
end

defmodule K8s.Io.Api.Extensions.V1beta1.DaemonSetCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastTransitionTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.DaemonSetList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Extensions.V1beta1.DaemonSet.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.DaemonSet
end

defmodule K8s.Io.Api.Extensions.V1beta1.DaemonSetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil,
          updateStrategy: K8s.Io.Api.Extensions.V1beta1.DaemonSetUpdateStrategy.t() | nil,
          minReadySeconds: integer,
          templateGeneration: integer,
          revisionHistoryLimit: integer
        }
  defstruct [
    :selector,
    :template,
    :updateStrategy,
    :minReadySeconds,
    :templateGeneration,
    :revisionHistoryLimit
  ]

  field :selector, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :template, 2, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec

  field :updateStrategy, 3,
    optional: true,
    type: K8s.Io.Api.Extensions.V1beta1.DaemonSetUpdateStrategy

  field :minReadySeconds, 4, optional: true, type: :int32
  field :templateGeneration, 5, optional: true, type: :int64
  field :revisionHistoryLimit, 6, optional: true, type: :int32
end

defmodule K8s.Io.Api.Extensions.V1beta1.DaemonSetStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          currentNumberScheduled: integer,
          numberMisscheduled: integer,
          desiredNumberScheduled: integer,
          numberReady: integer,
          observedGeneration: integer,
          updatedNumberScheduled: integer,
          numberAvailable: integer,
          numberUnavailable: integer,
          collisionCount: integer,
          conditions: [K8s.Io.Api.Extensions.V1beta1.DaemonSetCondition.t()]
        }
  defstruct [
    :currentNumberScheduled,
    :numberMisscheduled,
    :desiredNumberScheduled,
    :numberReady,
    :observedGeneration,
    :updatedNumberScheduled,
    :numberAvailable,
    :numberUnavailable,
    :collisionCount,
    :conditions
  ]

  field :currentNumberScheduled, 1, optional: true, type: :int32
  field :numberMisscheduled, 2, optional: true, type: :int32
  field :desiredNumberScheduled, 3, optional: true, type: :int32
  field :numberReady, 4, optional: true, type: :int32
  field :observedGeneration, 5, optional: true, type: :int64
  field :updatedNumberScheduled, 6, optional: true, type: :int32
  field :numberAvailable, 7, optional: true, type: :int32
  field :numberUnavailable, 8, optional: true, type: :int32
  field :collisionCount, 9, optional: true, type: :int32
  field :conditions, 10, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.DaemonSetCondition
end

defmodule K8s.Io.Api.Extensions.V1beta1.DaemonSetUpdateStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          rollingUpdate: K8s.Io.Api.Extensions.V1beta1.RollingUpdateDaemonSet.t() | nil
        }
  defstruct [:type, :rollingUpdate]

  field :type, 1, optional: true, type: :string

  field :rollingUpdate, 2,
    optional: true,
    type: K8s.Io.Api.Extensions.V1beta1.RollingUpdateDaemonSet
end

defmodule K8s.Io.Api.Extensions.V1beta1.Deployment do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Extensions.V1beta1.DeploymentSpec.t() | nil,
          status: K8s.Io.Api.Extensions.V1beta1.DeploymentStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.DeploymentSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Extensions.V1beta1.DeploymentStatus
end

defmodule K8s.Io.Api.Extensions.V1beta1.DeploymentCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastUpdateTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastUpdateTime, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastUpdateTime, 6, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :lastTransitionTime, 7, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.DeploymentList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Extensions.V1beta1.Deployment.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.Deployment
end

defmodule K8s.Io.Api.Extensions.V1beta1.DeploymentRollback do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          name: String.t(),
          updatedAnnotations: %{String.t() => String.t()},
          rollbackTo: K8s.Io.Api.Extensions.V1beta1.RollbackConfig.t() | nil
        }
  defstruct [:name, :updatedAnnotations, :rollbackTo]

  field :name, 1, optional: true, type: :string

  field :updatedAnnotations, 2,
    repeated: true,
    type: K8s.Io.Api.Extensions.V1beta1.DeploymentRollback.UpdatedAnnotationsEntry,
    map: true

  field :rollbackTo, 3, optional: true, type: K8s.Io.Api.Extensions.V1beta1.RollbackConfig
end

defmodule K8s.Io.Api.Extensions.V1beta1.DeploymentRollback.UpdatedAnnotationsEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.DeploymentSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil,
          strategy: K8s.Io.Api.Extensions.V1beta1.DeploymentStrategy.t() | nil,
          minReadySeconds: integer,
          revisionHistoryLimit: integer,
          paused: boolean,
          rollbackTo: K8s.Io.Api.Extensions.V1beta1.RollbackConfig.t() | nil,
          progressDeadlineSeconds: integer
        }
  defstruct [
    :replicas,
    :selector,
    :template,
    :strategy,
    :minReadySeconds,
    :revisionHistoryLimit,
    :paused,
    :rollbackTo,
    :progressDeadlineSeconds
  ]

  field :replicas, 1, optional: true, type: :int32
  field :selector, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :template, 3, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
  field :strategy, 4, optional: true, type: K8s.Io.Api.Extensions.V1beta1.DeploymentStrategy
  field :minReadySeconds, 5, optional: true, type: :int32
  field :revisionHistoryLimit, 6, optional: true, type: :int32
  field :paused, 7, optional: true, type: :bool
  field :rollbackTo, 8, optional: true, type: K8s.Io.Api.Extensions.V1beta1.RollbackConfig
  field :progressDeadlineSeconds, 9, optional: true, type: :int32
end

defmodule K8s.Io.Api.Extensions.V1beta1.DeploymentStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          observedGeneration: integer,
          replicas: integer,
          updatedReplicas: integer,
          readyReplicas: integer,
          availableReplicas: integer,
          unavailableReplicas: integer,
          conditions: [K8s.Io.Api.Extensions.V1beta1.DeploymentCondition.t()],
          collisionCount: integer
        }
  defstruct [
    :observedGeneration,
    :replicas,
    :updatedReplicas,
    :readyReplicas,
    :availableReplicas,
    :unavailableReplicas,
    :conditions,
    :collisionCount
  ]

  field :observedGeneration, 1, optional: true, type: :int64
  field :replicas, 2, optional: true, type: :int32
  field :updatedReplicas, 3, optional: true, type: :int32
  field :readyReplicas, 7, optional: true, type: :int32
  field :availableReplicas, 4, optional: true, type: :int32
  field :unavailableReplicas, 5, optional: true, type: :int32
  field :conditions, 6, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.DeploymentCondition
  field :collisionCount, 8, optional: true, type: :int32
end

defmodule K8s.Io.Api.Extensions.V1beta1.DeploymentStrategy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          rollingUpdate: K8s.Io.Api.Extensions.V1beta1.RollingUpdateDeployment.t() | nil
        }
  defstruct [:type, :rollingUpdate]

  field :type, 1, optional: true, type: :string

  field :rollingUpdate, 2,
    optional: true,
    type: K8s.Io.Api.Extensions.V1beta1.RollingUpdateDeployment
end

defmodule K8s.Io.Api.Extensions.V1beta1.FSGroupStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          ranges: [K8s.Io.Api.Extensions.V1beta1.IDRange.t()]
        }
  defstruct [:rule, :ranges]

  field :rule, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.IDRange
end

defmodule K8s.Io.Api.Extensions.V1beta1.HTTPIngressPath do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          path: String.t(),
          backend: K8s.Io.Api.Extensions.V1beta1.IngressBackend.t() | nil
        }
  defstruct [:path, :backend]

  field :path, 1, optional: true, type: :string
  field :backend, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.IngressBackend
end

defmodule K8s.Io.Api.Extensions.V1beta1.HTTPIngressRuleValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          paths: [K8s.Io.Api.Extensions.V1beta1.HTTPIngressPath.t()]
        }
  defstruct [:paths]

  field :paths, 1, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.HTTPIngressPath
end

defmodule K8s.Io.Api.Extensions.V1beta1.HostPortRange do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          min: integer,
          max: integer
        }
  defstruct [:min, :max]

  field :min, 1, optional: true, type: :int32
  field :max, 2, optional: true, type: :int32
end

defmodule K8s.Io.Api.Extensions.V1beta1.IDRange do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          min: integer,
          max: integer
        }
  defstruct [:min, :max]

  field :min, 1, optional: true, type: :int64
  field :max, 2, optional: true, type: :int64
end

defmodule K8s.Io.Api.Extensions.V1beta1.IPBlock do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          cidr: String.t(),
          except: [String.t()]
        }
  defstruct [:cidr, :except]

  field :cidr, 1, optional: true, type: :string
  field :except, 2, repeated: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.Ingress do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Extensions.V1beta1.IngressSpec.t() | nil,
          status: K8s.Io.Api.Extensions.V1beta1.IngressStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.IngressSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Extensions.V1beta1.IngressStatus
end

defmodule K8s.Io.Api.Extensions.V1beta1.IngressBackend do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          serviceName: String.t(),
          servicePort: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:serviceName, :servicePort]

  field :serviceName, 1, optional: true, type: :string
  field :servicePort, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Extensions.V1beta1.IngressList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Extensions.V1beta1.Ingress.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.Ingress
end

defmodule K8s.Io.Api.Extensions.V1beta1.IngressRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          host: String.t(),
          ingressRuleValue: K8s.Io.Api.Extensions.V1beta1.IngressRuleValue.t() | nil
        }
  defstruct [:host, :ingressRuleValue]

  field :host, 1, optional: true, type: :string
  field :ingressRuleValue, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.IngressRuleValue
end

defmodule K8s.Io.Api.Extensions.V1beta1.IngressRuleValue do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          http: K8s.Io.Api.Extensions.V1beta1.HTTPIngressRuleValue.t() | nil
        }
  defstruct [:http]

  field :http, 1, optional: true, type: K8s.Io.Api.Extensions.V1beta1.HTTPIngressRuleValue
end

defmodule K8s.Io.Api.Extensions.V1beta1.IngressSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          backend: K8s.Io.Api.Extensions.V1beta1.IngressBackend.t() | nil,
          tls: [K8s.Io.Api.Extensions.V1beta1.IngressTLS.t()],
          rules: [K8s.Io.Api.Extensions.V1beta1.IngressRule.t()]
        }
  defstruct [:backend, :tls, :rules]

  field :backend, 1, optional: true, type: K8s.Io.Api.Extensions.V1beta1.IngressBackend
  field :tls, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.IngressTLS
  field :rules, 3, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.IngressRule
end

defmodule K8s.Io.Api.Extensions.V1beta1.IngressStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          loadBalancer: K8s.Io.Api.Core.V1.LoadBalancerStatus.t() | nil
        }
  defstruct [:loadBalancer]

  field :loadBalancer, 1, optional: true, type: K8s.Io.Api.Core.V1.LoadBalancerStatus
end

defmodule K8s.Io.Api.Extensions.V1beta1.IngressTLS do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          hosts: [String.t()],
          secretName: String.t()
        }
  defstruct [:hosts, :secretName]

  field :hosts, 1, repeated: true, type: :string
  field :secretName, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.NetworkPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Extensions.V1beta1.NetworkPolicySpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.NetworkPolicySpec
end

defmodule K8s.Io.Api.Extensions.V1beta1.NetworkPolicyEgressRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ports: [K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPort.t()],
          to: [K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPeer.t()]
        }
  defstruct [:ports, :to]

  field :ports, 1, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPort
  field :to, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPeer
end

defmodule K8s.Io.Api.Extensions.V1beta1.NetworkPolicyIngressRule do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          ports: [K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPort.t()],
          from: [K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPeer.t()]
        }
  defstruct [:ports, :from]

  field :ports, 1, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPort
  field :from, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPeer
end

defmodule K8s.Io.Api.Extensions.V1beta1.NetworkPolicyList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Extensions.V1beta1.NetworkPolicy.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.NetworkPolicy
end

defmodule K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPeer do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          namespaceSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          ipBlock: K8s.Io.Api.Extensions.V1beta1.IPBlock.t() | nil
        }
  defstruct [:podSelector, :namespaceSelector, :ipBlock]

  field :podSelector, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :namespaceSelector, 2,
    optional: true,
    type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector

  field :ipBlock, 3, optional: true, type: K8s.Io.Api.Extensions.V1beta1.IPBlock
end

defmodule K8s.Io.Api.Extensions.V1beta1.NetworkPolicyPort do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          protocol: String.t(),
          port: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:protocol, :port]

  field :protocol, 1, optional: true, type: :string
  field :port, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Extensions.V1beta1.NetworkPolicySpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          podSelector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          ingress: [K8s.Io.Api.Extensions.V1beta1.NetworkPolicyIngressRule.t()],
          egress: [K8s.Io.Api.Extensions.V1beta1.NetworkPolicyEgressRule.t()],
          policyTypes: [String.t()]
        }
  defstruct [:podSelector, :ingress, :egress, :policyTypes]

  field :podSelector, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :ingress, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.NetworkPolicyIngressRule
  field :egress, 3, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.NetworkPolicyEgressRule
  field :policyTypes, 4, repeated: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.PodSecurityPolicy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Extensions.V1beta1.PodSecurityPolicySpec.t() | nil
        }
  defstruct [:metadata, :spec]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.PodSecurityPolicySpec
end

defmodule K8s.Io.Api.Extensions.V1beta1.PodSecurityPolicyList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Extensions.V1beta1.PodSecurityPolicy.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.PodSecurityPolicy
end

defmodule K8s.Io.Api.Extensions.V1beta1.PodSecurityPolicySpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          privileged: boolean,
          defaultAddCapabilities: [String.t()],
          requiredDropCapabilities: [String.t()],
          allowedCapabilities: [String.t()],
          volumes: [String.t()],
          hostNetwork: boolean,
          hostPorts: [K8s.Io.Api.Extensions.V1beta1.HostPortRange.t()],
          hostPID: boolean,
          hostIPC: boolean,
          seLinux: K8s.Io.Api.Extensions.V1beta1.SELinuxStrategyOptions.t() | nil,
          runAsUser: K8s.Io.Api.Extensions.V1beta1.RunAsUserStrategyOptions.t() | nil,
          runAsGroup: K8s.Io.Api.Extensions.V1beta1.RunAsGroupStrategyOptions.t() | nil,
          supplementalGroups:
            K8s.Io.Api.Extensions.V1beta1.SupplementalGroupsStrategyOptions.t() | nil,
          fsGroup: K8s.Io.Api.Extensions.V1beta1.FSGroupStrategyOptions.t() | nil,
          readOnlyRootFilesystem: boolean,
          defaultAllowPrivilegeEscalation: boolean,
          allowPrivilegeEscalation: boolean,
          allowedHostPaths: [K8s.Io.Api.Extensions.V1beta1.AllowedHostPath.t()],
          allowedFlexVolumes: [K8s.Io.Api.Extensions.V1beta1.AllowedFlexVolume.t()],
          allowedCSIDrivers: [K8s.Io.Api.Extensions.V1beta1.AllowedCSIDriver.t()],
          allowedUnsafeSysctls: [String.t()],
          forbiddenSysctls: [String.t()],
          allowedProcMountTypes: [String.t()],
          runtimeClass: K8s.Io.Api.Extensions.V1beta1.RuntimeClassStrategyOptions.t() | nil
        }
  defstruct [
    :privileged,
    :defaultAddCapabilities,
    :requiredDropCapabilities,
    :allowedCapabilities,
    :volumes,
    :hostNetwork,
    :hostPorts,
    :hostPID,
    :hostIPC,
    :seLinux,
    :runAsUser,
    :runAsGroup,
    :supplementalGroups,
    :fsGroup,
    :readOnlyRootFilesystem,
    :defaultAllowPrivilegeEscalation,
    :allowPrivilegeEscalation,
    :allowedHostPaths,
    :allowedFlexVolumes,
    :allowedCSIDrivers,
    :allowedUnsafeSysctls,
    :forbiddenSysctls,
    :allowedProcMountTypes,
    :runtimeClass
  ]

  field :privileged, 1, optional: true, type: :bool
  field :defaultAddCapabilities, 2, repeated: true, type: :string
  field :requiredDropCapabilities, 3, repeated: true, type: :string
  field :allowedCapabilities, 4, repeated: true, type: :string
  field :volumes, 5, repeated: true, type: :string
  field :hostNetwork, 6, optional: true, type: :bool
  field :hostPorts, 7, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.HostPortRange
  field :hostPID, 8, optional: true, type: :bool
  field :hostIPC, 9, optional: true, type: :bool
  field :seLinux, 10, optional: true, type: K8s.Io.Api.Extensions.V1beta1.SELinuxStrategyOptions

  field :runAsUser, 11,
    optional: true,
    type: K8s.Io.Api.Extensions.V1beta1.RunAsUserStrategyOptions

  field :runAsGroup, 22,
    optional: true,
    type: K8s.Io.Api.Extensions.V1beta1.RunAsGroupStrategyOptions

  field :supplementalGroups, 12,
    optional: true,
    type: K8s.Io.Api.Extensions.V1beta1.SupplementalGroupsStrategyOptions

  field :fsGroup, 13, optional: true, type: K8s.Io.Api.Extensions.V1beta1.FSGroupStrategyOptions
  field :readOnlyRootFilesystem, 14, optional: true, type: :bool
  field :defaultAllowPrivilegeEscalation, 15, optional: true, type: :bool
  field :allowPrivilegeEscalation, 16, optional: true, type: :bool
  field :allowedHostPaths, 17, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.AllowedHostPath

  field :allowedFlexVolumes, 18,
    repeated: true,
    type: K8s.Io.Api.Extensions.V1beta1.AllowedFlexVolume

  field :allowedCSIDrivers, 23,
    repeated: true,
    type: K8s.Io.Api.Extensions.V1beta1.AllowedCSIDriver

  field :allowedUnsafeSysctls, 19, repeated: true, type: :string
  field :forbiddenSysctls, 20, repeated: true, type: :string
  field :allowedProcMountTypes, 21, repeated: true, type: :string

  field :runtimeClass, 24,
    optional: true,
    type: K8s.Io.Api.Extensions.V1beta1.RuntimeClassStrategyOptions
end

defmodule K8s.Io.Api.Extensions.V1beta1.ReplicaSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Extensions.V1beta1.ReplicaSetSpec.t() | nil,
          status: K8s.Io.Api.Extensions.V1beta1.ReplicaSetStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.ReplicaSetSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Extensions.V1beta1.ReplicaSetStatus
end

defmodule K8s.Io.Api.Extensions.V1beta1.ReplicaSetCondition do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          type: String.t(),
          status: String.t(),
          lastTransitionTime: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time.t() | nil,
          reason: String.t(),
          message: String.t()
        }
  defstruct [:type, :status, :lastTransitionTime, :reason, :message]

  field :type, 1, optional: true, type: :string
  field :status, 2, optional: true, type: :string
  field :lastTransitionTime, 3, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.Time
  field :reason, 4, optional: true, type: :string
  field :message, 5, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.ReplicaSetList do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta.t() | nil,
          items: [K8s.Io.Api.Extensions.V1beta1.ReplicaSet.t()]
        }
  defstruct [:metadata, :items]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ListMeta
  field :items, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.ReplicaSet
end

defmodule K8s.Io.Api.Extensions.V1beta1.ReplicaSetSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          minReadySeconds: integer,
          selector: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector.t() | nil,
          template: K8s.Io.Api.Core.V1.PodTemplateSpec.t() | nil
        }
  defstruct [:replicas, :minReadySeconds, :selector, :template]

  field :replicas, 1, optional: true, type: :int32
  field :minReadySeconds, 4, optional: true, type: :int32
  field :selector, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.LabelSelector
  field :template, 3, optional: true, type: K8s.Io.Api.Core.V1.PodTemplateSpec
end

defmodule K8s.Io.Api.Extensions.V1beta1.ReplicaSetStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          fullyLabeledReplicas: integer,
          readyReplicas: integer,
          availableReplicas: integer,
          observedGeneration: integer,
          conditions: [K8s.Io.Api.Extensions.V1beta1.ReplicaSetCondition.t()]
        }
  defstruct [
    :replicas,
    :fullyLabeledReplicas,
    :readyReplicas,
    :availableReplicas,
    :observedGeneration,
    :conditions
  ]

  field :replicas, 1, optional: true, type: :int32
  field :fullyLabeledReplicas, 2, optional: true, type: :int32
  field :readyReplicas, 4, optional: true, type: :int32
  field :availableReplicas, 5, optional: true, type: :int32
  field :observedGeneration, 3, optional: true, type: :int64
  field :conditions, 6, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.ReplicaSetCondition
end

defmodule K8s.Io.Api.Extensions.V1beta1.ReplicationControllerDummy do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{}
  defstruct []
end

defmodule K8s.Io.Api.Extensions.V1beta1.RollbackConfig do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          revision: integer
        }
  defstruct [:revision]

  field :revision, 1, optional: true, type: :int64
end

defmodule K8s.Io.Api.Extensions.V1beta1.RollingUpdateDaemonSet do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          maxUnavailable: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:maxUnavailable]

  field :maxUnavailable, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Extensions.V1beta1.RollingUpdateDeployment do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          maxUnavailable: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil,
          maxSurge: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString.t() | nil
        }
  defstruct [:maxUnavailable, :maxSurge]

  field :maxUnavailable, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
  field :maxSurge, 2, optional: true, type: K8s.Io.Apimachinery.Pkg.Util.Intstr.IntOrString
end

defmodule K8s.Io.Api.Extensions.V1beta1.RunAsGroupStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          ranges: [K8s.Io.Api.Extensions.V1beta1.IDRange.t()]
        }
  defstruct [:rule, :ranges]

  field :rule, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.IDRange
end

defmodule K8s.Io.Api.Extensions.V1beta1.RunAsUserStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          ranges: [K8s.Io.Api.Extensions.V1beta1.IDRange.t()]
        }
  defstruct [:rule, :ranges]

  field :rule, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.IDRange
end

defmodule K8s.Io.Api.Extensions.V1beta1.RuntimeClassStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          allowedRuntimeClassNames: [String.t()],
          defaultRuntimeClassName: String.t()
        }
  defstruct [:allowedRuntimeClassNames, :defaultRuntimeClassName]

  field :allowedRuntimeClassNames, 1, repeated: true, type: :string
  field :defaultRuntimeClassName, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.SELinuxStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          seLinuxOptions: K8s.Io.Api.Core.V1.SELinuxOptions.t() | nil
        }
  defstruct [:rule, :seLinuxOptions]

  field :rule, 1, optional: true, type: :string
  field :seLinuxOptions, 2, optional: true, type: K8s.Io.Api.Core.V1.SELinuxOptions
end

defmodule K8s.Io.Api.Extensions.V1beta1.Scale do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          metadata: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta.t() | nil,
          spec: K8s.Io.Api.Extensions.V1beta1.ScaleSpec.t() | nil,
          status: K8s.Io.Api.Extensions.V1beta1.ScaleStatus.t() | nil
        }
  defstruct [:metadata, :spec, :status]

  field :metadata, 1, optional: true, type: K8s.Io.Apimachinery.Pkg.Apis.Meta.V1.ObjectMeta
  field :spec, 2, optional: true, type: K8s.Io.Api.Extensions.V1beta1.ScaleSpec
  field :status, 3, optional: true, type: K8s.Io.Api.Extensions.V1beta1.ScaleStatus
end

defmodule K8s.Io.Api.Extensions.V1beta1.ScaleSpec do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer
        }
  defstruct [:replicas]

  field :replicas, 1, optional: true, type: :int32
end

defmodule K8s.Io.Api.Extensions.V1beta1.ScaleStatus do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          replicas: integer,
          selector: %{String.t() => String.t()},
          targetSelector: String.t()
        }
  defstruct [:replicas, :selector, :targetSelector]

  field :replicas, 1, optional: true, type: :int32

  field :selector, 2,
    repeated: true,
    type: K8s.Io.Api.Extensions.V1beta1.ScaleStatus.SelectorEntry,
    map: true

  field :targetSelector, 3, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.ScaleStatus.SelectorEntry do
  @moduledoc false
  use Protobuf, map: true, syntax: :proto2

  @type t :: %__MODULE__{
          key: String.t(),
          value: String.t()
        }
  defstruct [:key, :value]

  field :key, 1, optional: true, type: :string
  field :value, 2, optional: true, type: :string
end

defmodule K8s.Io.Api.Extensions.V1beta1.SupplementalGroupsStrategyOptions do
  @moduledoc false
  use Protobuf, syntax: :proto2

  @type t :: %__MODULE__{
          rule: String.t(),
          ranges: [K8s.Io.Api.Extensions.V1beta1.IDRange.t()]
        }
  defstruct [:rule, :ranges]

  field :rule, 1, optional: true, type: :string
  field :ranges, 2, repeated: true, type: K8s.Io.Api.Extensions.V1beta1.IDRange
end
